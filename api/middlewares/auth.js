const jwt = require('jsonwebtoken');

//error code 00
module.exports = (req, res, next) => {
    const token = req.header('Authorization');
    if (!token) return res.status(401).json({code:"401.0", message: 'Access Denied' });

    try {
        const verified = jwt.verify(token, process.env.JWT_SECRET);
        req.user = verified;
        next();
    } catch (err) {
        res.status(400).json({code:"400.0", message: 'Invalid Token' });
    }
};
