package com.parshwapolymers.productshowcase.parshwapolymers.models;

import org.bson.types.Binary;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.TextIndexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.TextScore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Document(collection = "Products")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Products {
    @Id
    private ObjectId id;
    private String idforapp;
    private Binary image;
    @TextIndexed(weight = 2)
    private String name;
    @TextIndexed
    private String title;
    @TextIndexed
    private String material;
    @TextScore
    Float score;
    public Products(Binary image, String name, String title, String material) {
        this.image = image;
        this.name = name;
        this.title = title;
        this.material = material;
    }
    public void setImage(String string) {
    }

    
}
