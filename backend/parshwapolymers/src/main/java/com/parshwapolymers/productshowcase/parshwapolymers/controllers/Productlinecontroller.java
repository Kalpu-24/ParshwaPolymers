package com.parshwapolymers.productshowcase.parshwapolymers.controllers;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.parshwapolymers.productshowcase.parshwapolymers.models.Productlines;
import com.parshwapolymers.productshowcase.parshwapolymers.services.Productlinesservice;


@RestController
@RequestMapping("/api/parshwapolymers/productlines")
public class Productlinecontroller {
    @Autowired
    private Productlinesservice productlinesservice;
    @GetMapping("/getAllProductLines")
    public ResponseEntity<List<Productlines>> getAllProductLines(){
        return new ResponseEntity<List<Productlines>>(productlinesservice.allProductLines(),HttpStatus.OK);
    }
    @GetMapping("/getProductLine/{id}")
    public ResponseEntity<Optional<Productlines>> getProductLineById(@PathVariable ObjectId id){
        return new ResponseEntity<Optional<Productlines>>(productlinesservice.getProductLine(id),HttpStatus.OK);
    }
    @GetMapping("/getProductLineByTitle/{title}")
    public ResponseEntity<List<Productlines>> getProductLineByTitle(@PathVariable String title){
        return new ResponseEntity<List<Productlines>>(productlinesservice.getProductLineByTitle(title),HttpStatus.OK);
    }
    @PostMapping("/addProductLine")
    public ResponseEntity<Productlines> addProductLine(@PathVariable Map<String,Object> productline){
        return new ResponseEntity<Productlines>(productlinesservice.addProductLine(productline.get("title").toString(),productline.get("description").toString()),HttpStatus.OK);
    }
}
