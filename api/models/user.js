const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');

const UserSchema = new mongoose.Schema({
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    referralId: { type: String },    
    name: { type: String },
    referredBy: { type: String },
    coupons: [
        {
            code: { type: String, required: true },
            isUsed: { type: Boolean, default: false }
        }
    ],    
    firstPurchase: { type: Boolean, default: false },
    balance: { type: Number, default: 10000 },
    referralLink: { type: String }
});

UserSchema.pre('save', async function (next) {
    if (!this.isModified('password')) return next();
    this.password = await bcrypt.hash(this.password, 10);
    next();
});

UserSchema.methods.comparePassword = async function (password) {
    return await bcrypt.compare(password, this.password);
};

module.exports = mongoose.model('User', UserSchema);
