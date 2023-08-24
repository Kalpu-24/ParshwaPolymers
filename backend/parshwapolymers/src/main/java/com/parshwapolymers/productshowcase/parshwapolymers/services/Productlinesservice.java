package com.parshwapolymers.productshowcase.parshwapolymers.services;

import java.util.List;
import java.util.Optional;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.parshwapolymers.productshowcase.parshwapolymers.models.Productlines;
import com.parshwapolymers.productshowcase.parshwapolymers.repos.Productlinesrepo;

@Service
public class Productlinesservice {
    @Autowired
    private Productlinesrepo productlinesrepo;
    public List<Productlines> allProductLines(){
        List<Productlines> productlines = productlinesrepo.findAll();
        for (Productlines productlines2 : productlines) {
            productlines2.setImage("data:image/png;base64," + new String(productlines2.getImage().getData()));
        }
        System.out.println(productlines);
        return productlines;
    }

    public Optional<Productlines> getProductLine(ObjectId id){
        Optional<Productlines> prOptional = productlinesrepo.findById(id);
        Productlines productlines = prOptional.get();
        productlines.setImage("data:image/png;base64," + new String(productlines.getImage().getData()));
        return prOptional;
    }

    public List<Productlines> getProductLineByTitle(String title){
        List<Productlines> productlines =  productlinesrepo.findByTitle(title);
        for (Productlines productlines2 : productlines) {
            productlines2.setImage("data:image/png;base64," + new String(productlines2.getImage().getData()));
        }
        return productlines;
    }

    public Productlines addProductLine(String title,String description) {
        Productlines productlines=new Productlines();
        productlines.setTitle(title);
        productlines.setDescription(description);
        return productlinesrepo.save(productlines);
    }
}
