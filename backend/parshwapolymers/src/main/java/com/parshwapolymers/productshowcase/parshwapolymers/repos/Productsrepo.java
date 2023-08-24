package com.parshwapolymers.productshowcase.parshwapolymers.repos;

import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.parshwapolymers.productshowcase.parshwapolymers.models.Products;

@Repository
public interface Productsrepo extends MongoRepository<Products,ObjectId>{
    public List<Products> findAllByTitle(String title);
}
