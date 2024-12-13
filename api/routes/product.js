const express = require('express');
const Product = require('../models/product');
const auth = require('../middlewares/auth');
const router = express.Router();
//error code 50
router.get('/', auth, async (req, res) => {
    try {
        const products = await Product.find();
        res.json({ products });
    } catch (err) {
        res.status(500).json({code:"500", message: 'Server Error' });
    }
});
//error code 60
router.post('/', auth, async (req, res) => {
    const { name, description, price, stock } = req.body;
    try {
        const newProduct = new Product({ name, description, price, stock });
        await newProduct.save();
        res.status(201).json( newProduct );
    } catch (err) {
        res.status(400).json({code:"400.60", message: 'Failed to add product', error: err.message });
    }
});

module.exports = router;
