const express = require('express');
const User = require('../models/user');
const auth = require('../middlewares/auth');
const router = express.Router();
//error code 40
router.get('/', auth, async (req, res) => {
    try {
        const user = await User.findById(req.user.id);
        res.json({ coupons: user.coupons });
    } catch (err) {
        res.status(500).json({ code:"500", message: err.message });
    }
});

module.exports = router;
