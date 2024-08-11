const express = require("express");
const productRouter = express.Router();
const auth = require('../middlewares/auth');
const { Product } = require("../models/product");
productRouter.get("/api/products/", auth, async (req, res) => {
    try {
      const products = await Product.find({ category: req.query.category });
      res.json(products);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
productRouter.get("/api/products/search/:name", auth, async(req, res)=>{
  try{
    const products = await Product.findByName({category:req.params.name});
    res.json(products);
  }catch(e){
    res.status(500).json({error :e.message})
  }
})  

    module.exports = productRouter;