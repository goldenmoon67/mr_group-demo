const mongoose = require('mongoose');

const TokenSchema = new mongoose.Schema({
    userId: { type: mongoose.Schema.Types.ObjectId, required: true },
    token: { type: String, required: true },
    expiresAt: { type: Date, required: true }
});

module.exports = mongoose.model('Token', TokenSchema);
