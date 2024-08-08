const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');

// add product
 adminRouter.post('/admin/add-product', admin,async (req, res)=>{
    try{
        const {name, description , images, quantity, price,category}=req;
        let product = new Product({
            name,
            description,
            images,
            quantity,
            category,
            price,
        });
        product = await product.save();
        res.json(product);
    }catch(e){
        res.status(500);
    }
 });
 module.exports = adminRouter;
