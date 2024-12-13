const mongoose = require('mongoose');

const PurchaseSchema = new mongoose.Schema({
    userId: { type: String, required: true },
    amount: { type: Number, required: true },
    firstPurchase: { type: Boolean, default: false },
});

module.exports = mongoose.model('Purchase', PurchaseSchema);
