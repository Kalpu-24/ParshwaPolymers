package com.parshwapolymers.productshowcase.parshwapolymers.models;

import java.util.List;

import org.bson.types.Binary;
// import org.bson.types.Binary;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.DocumentReference;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Document(collection = "ProductLines")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Productlines{
    @Id
    private ObjectId id;
    private String title;
    private Binary image;
    private String description;
    @DocumentReference
    private List<Products> ids;
    public void setImage(String string) {
    }

}