const express = require('express');
const User = require("../models/user");

const authRouter = express.Router(); //--> use only in this file 

authRouter.post('/api/signup', async (req , res)=>
{
    //get data
    const {name , email , password } = req.body ;

    const existingUser = User.findOne({email});




    // post data to database
    //return that data to user 

})
//mouch private wallet
module.exports = authRouter;