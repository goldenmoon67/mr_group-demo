const express = require('express');
const jwt = require('jsonwebtoken');
const User = require('../models/user');
const Token = require('../models/token');
const router = express.Router();
require('dotenv').config();

const generateAccessToken = (user) => {
    return jwt.sign({ id: user._id, email: user.email }, process.env.JWT_SECRET, { expiresIn: '15m' });
};

const generateRefreshToken = async (user) => {
    const token = jwt.sign({ id: user._id }, process.env.REFRESH_TOKEN_SECRET, { expiresIn: '7d' });

    const newToken = new Token({
        userId: user._id,
        token,
        expiresAt: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000)
    });

    await newToken.save();
    return token;
};
//error code 10
router.post('/register', async (req, res) => {
    const { name, email, password, referredBy } = req.body;
    try {
        const existingUser = await User.findOne({ email });
        if (existingUser) return res.status(400).json({ code: "400.10", message: 'User already exists' });

        const referralId = Math.random().toString(36).substring(2, 10);
        const DYNAMIC_LINK_BASE_URL = process.env.DYNAMIC_LINK_BASE_URL || 'http://example.com';
        const referralLink = `${DYNAMIC_LINK_BASE_URL}?referralId=${referralId}`;

        const user = new User({ name, email, password, referredBy, referralId,referralLink});
        await user.save();

        res.status(201).json({ message: 'User registered successfully' });
    } catch (err) {
        res.status(500).json({ code: "500", message: err.message });
    }
});

//error code 20
router.post('/refresh', async (req, res) => {
    const { refreshToken } = req.body;
    if (!refreshToken) {
        return res.status(400).json({ code: "401.20", message: 'Refresh token required' });
    }

    try {
        const decoded = jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET);
        const user = await User.findById(decoded.id);
        if (!user) {
            return res.status(404).json({ code: "404.20", message: 'User not found' });
        }

        const newAccessToken = generateAccessToken(user);
        return res.json({ accessToken: newAccessToken, expires_in: 9000 });
    } catch (err) {
        return res.status(401).json({ code: "401.21", message: 'Invalid or expired refresh token' });
    }
});


//error code 30
router.post('/login', async (req, res) => {
    const { email, password } = req.body;
    try {
        const user = await User.findOne({ email });
        if (!user) return res.status(400).json({ code: "400.30", message: 'User not found' });

        const isPasswordValid = await user.comparePassword(password);
        if (!isPasswordValid) return res.status(400).json({ code: "400.31", message: 'Invalid credentials' });

        const accessToken = generateAccessToken(user);
        const refreshToken = await generateRefreshToken(user);

        const accessTokenExpiry = 15 * 60;

        res.json({
            accessToken,
            refreshToken,
            expiresIn: accessTokenExpiry
        });
    } catch (err) {
        res.status(500).json({ code: "500", message: err.message });
    }
});


module.exports = router;
