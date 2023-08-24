package com.parshwapolymers.productshowcase.parshwapolymers.services;

import java.io.IOException;
import java.util.List;

import org.bson.BsonBinarySubType;
import org.bson.types.Binary;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.TextCriteria;
import org.springframework.data.mongodb.core.query.TextQuery;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.parshwapolymers.productshowcase.parshwapolymers.models.Productlines;
import com.parshwapolymers.productshowcase.parshwapolymers.models.Products;
import com.parshwapolymers.productshowcase.parshwapolymers.repos.Productsrepo;

@Service
public class ProductService {
    @Autowired
    private Productsrepo productsrepo;
    @Autowired
    private MongoTemplate mongoTemplate;

    public Products createProduct(MultipartFile image, String title, String name, String material) throws IOException {
        Products product = productsrepo.save(new Products(new Binary(BsonBinarySubType.BINARY, image.getBytes()), name, title, material));
        mongoTemplate.update(Productlines.class).matching(Criteria.where("title").is(title))
                .apply(new Update().push("ids").value(product)).first();
        return product;
    }

    public Products deleProducts(ObjectId id) {
        Products product = productsrepo.findById(id).get();
        productsrepo.deleteById(id);
        String title = product.getTitle().toString();
        mongoTemplate.update(Productlines.class).matching(Criteria.where("title").is(title))
                .apply(new Update().pull("ids", product)).first();
        return product;
    }

    public Products updateProducts(MultipartFile image,String title, String name, String material, ObjectId id) throws IOException {
        Products product = productsrepo.findById(id).get();
        if(!product.getTitle().equalsIgnoreCase(title)){
            mongoTemplate.update(Productlines.class).matching(Criteria.where("title").is(product.getTitle().toString()))
                    .apply(new Update().pull("ids", product)).first();
            mongoTemplate.update(Productlines.class).matching(Criteria.where("title").is(title))
                    .apply(new Update().push("ids").value(product)).first();
        }
        Update update = new Update();
        update.set("image", new Binary(BsonBinarySubType.BINARY, image.getBytes()));
        update.set("title", title);
        update.set("name", name);
        update.set("material", material);
        mongoTemplate.findAndModify(Query.query(Criteria.where("_id").is(id)), update, Products.class);

        return productsrepo.findById(id).get();
    }

    public List<Products> getAllProductsByText(String text) {
        TextCriteria criteria = TextCriteria.forDefaultLanguage().matchingAny(text);

        Query query = TextQuery.queryText(criteria).sortByScore();

        List<Products> list = mongoTemplate.find(query, Products.class);
        for (Products lit : list) {
            lit.setIdforapp(lit.getId().toString());
            lit.setImage("data:image/png;base64," + new String(lit.getImage().getData()));
        }
        return list;
    }

    public List<Products> getAllProducts() {
        List<Products> products = productsrepo.findAll();
        for (Products product : products) {
            product.setIdforapp(product.getId().toString());
            product.setImage("data:image/png;base64," + new String(product.getImage().getData()));
        }
       return products;
    }

    public Products getProductById(ObjectId id) {
        Products product = productsrepo.findById(id).get();
        product.setIdforapp(product.getId().toString());
        product.setImage("data:image/png;base64," + new String(product.getImage().getData()));
        return product;
    }
}