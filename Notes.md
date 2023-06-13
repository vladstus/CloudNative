# Notes
Book: Spring Native
Last page: 297


Open with Firefox

`./gradlew bootBuildImage` builds docker image 

`docker run --rm --name catalog-service -p 8080:8080 catalog-service:0.0.1-SNAPSHOT`


### Examples of API

```agsl
http POST :9001/books author="Lyra Silverstar" title="Northern Lights" isbn="12345678
91" price=9.90
```

```agsl
http :9001/books/1234567891
```

#### Bad Request Example

```agsl
http POST :9001/books author="Jon Snow" title="" isbn="123ABC456Z" price=9.90
```