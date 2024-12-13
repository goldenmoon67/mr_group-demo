const express = require('express');
const Purchase = require('../models/purchase');
const User = require('../models/user');
const Product = require('../models/product');
const auth = require('../middlewares/auth');
const router = express.Router();
//error code 70
router.post('/:productId', auth, async (req, res) => {
    const userId = req.user.id; 
    const { productId } = req.params;
try {
    const user = await User.findById(userId);
    if (!user) return res.status(404).json({ code: "404.70", message: "User not found" });

    const product = await Product.findById(productId);
    if (!product) return res.status(404).json({ code: "404.71", message: "Product not found" });

    let isFirstPurchase = !user.firstPurchase; 
    if (isFirstPurchase&&user.referredBy) {
        const referrer = await User.findOne({referralId:user.referredBy});
        if (referrer) {
            if (!Array.isArray(referrer.coupons)) {
                referrer.coupons = [];
            }
            referrer.coupons.push({ code: "500TL-Discount", isUsed: false });
            await referrer.save();
        }
        
        user.firstPurchase = true;
    } else {
        if (user.balance < product.price) {
            return res.status(400).json({ code: "400.70", message: "Insufficient balance" });
        }
    }

    user.balance -= product.price;
    await user.save();

    const purchase = new Purchase({
        userId: userId,
        amount: product.price,
        firstPurchase: false,
    });
    await purchase.save();

    res.status(201).json({ message: 'Purchase successful', purchase });
  
} catch (error) {
    res.status(500).json({ code: "500", message: "Internal server error" });

}
    });


module.exports = router;
