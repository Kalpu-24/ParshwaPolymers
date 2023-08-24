package com.parshwapolymers.productshowcase.parshwapolymers.repos;

import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.parshwapolymers.productshowcase.parshwapolymers.models.Productlines;

@Repository
public interface Productlinesrepo extends MongoRepository<Productlines, ObjectId>{
    public List<Productlines> findByTitle(String productline);
}
