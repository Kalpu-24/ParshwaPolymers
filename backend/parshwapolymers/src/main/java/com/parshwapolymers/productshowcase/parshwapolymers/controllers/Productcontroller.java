package com.parshwapolymers.productshowcase.parshwapolymers.controllers;

import java.io.IOException;
import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.parshwapolymers.productshowcase.parshwapolymers.models.Products;
import com.parshwapolymers.productshowcase.parshwapolymers.services.ProductService;

@RestController
@RequestMapping("/api/parshwapolymers/products")
public class Productcontroller {
    @Autowired
    private ProductService productService;
    @PostMapping("/add")
    public ResponseEntity<Products> addProduct(@RequestParam("title") String title,@RequestParam("name") String name,@RequestParam("material") String material, @RequestParam("image") MultipartFile image)throws IOException{
        return new ResponseEntity<Products>(productService.createProduct(image,title,name,material),HttpStatus.CREATED);
    }
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Products> deleteProduct(@PathVariable ObjectId id){
        return new ResponseEntity<Products>(productService.deleProducts(id),HttpStatus.OK);
    }
    @PostMapping("/edit/{id}")
    public ResponseEntity<Products> updateProduct(@RequestParam("title") String title,@RequestParam("name") String name,@RequestParam("material") String material,@PathVariable ObjectId id,@RequestParam("image") MultipartFile image)throws IOException{
        return new ResponseEntity<Products>(productService.updateProducts(image,title,name,material, id), HttpStatus.OK);
    }
    @GetMapping("/getById/{id}")
    public ResponseEntity<Products> getProductById(@PathVariable ObjectId id){
        return new ResponseEntity<Products>(productService.getProductById(id),HttpStatus.OK);
    }
    @GetMapping("/getAllProducts")
    public ResponseEntity<List<Products>> getAllProducts(){
        return new ResponseEntity<List<Products>>(productService.getAllProducts(),HttpStatus.OK);
    }
    @GetMapping("/search")
    public ResponseEntity<List<Products>>getAllProductsByText(@RequestBody String text){
        return new ResponseEntity<List<Products>>(productService.getAllProductsByText(text),HttpStatus.OK);
    }
}