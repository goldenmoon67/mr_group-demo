const express = require('express');
const auth = require('../middlewares/auth');
const User = require('../models/user');
const router = express.Router();
//error code 80
router.get('/session-user', auth, async (req, res) => {
    try {
        const user = await User.findById(req.user.id).select('-password'); 
        if (!user) {
            return res.status(404).json({ code: "404.80", message: 'User not found' });
        }
        res.json( user );
    } catch (err) {
        res.status(500).json({ code: "500", message: 'Server Error' });
    }
});


router.post('/use-coupon', auth, async (req, res) => {
    const { couponCode } = req.body;

    if (!couponCode) {
        return res.status(400).json({ success: false, message: "Coupon code is required." });
    }

    try {
        const userId = req.user.id;
        const user = await User.findById(userId);
        if (!user) {
            return res.status(404).json({ success: false, message: "User not found." });
        }
        const coupon = user.coupons.find(c => c.code === couponCode&&c.isUsed === false);
        if (!coupon) {
            return res.status(404).json({ success: false, message: "Coupon not found." });
        }
        if (coupon.isUsed) {
            return res.status(400).json({ success: false, message: "Coupon already used." });
        }
        coupon.isUsed = true;
        await user.save();

        res.status(200).json({ 
            success: true, 
            message: "Coupon used successfully.", 
        });
    } catch (error) {
        console.error("Error using coupon:", error);
        res.status(500).json({ success: false, message: "An error occurred while using the coupon." });
    }
});


module.exports = router;
