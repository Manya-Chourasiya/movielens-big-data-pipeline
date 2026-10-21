USE movielens_manya_chourasiya;                                                                                                                                                            
                                                                                                                                                                                           
                                                                                                                                                                                           
                                                                                                                                                                                           
SELECT                                                                                                                                                                                     
                                                                                                                                                                                           
    genre,                                                                                                                                                                                 
                                                                                                                                                                                           
    COUNT(*) AS number_of_ratings,                                                                                                                                                         
                                                                                                                                                                                           
    ROUND(AVG(rating), 4) AS average_rating                                                                                                                                                
                                                                                                                                                                                           
FROM (                                                                                                                                                                                     
                                                                                                                                                                                           
    SELECT r.rating, m.unknown, m.action, m.adventure,                                                                                                                                     
                                                                                                                                                                                           
           m.animation, m.children, m.comedy, m.crime,                                                                                                                                     
                                                                                                                                                                                           
           m.documentary, m.drama, m.fantasy, m.film_noir,                                                                                                                                 
                                                                                                                                                                                           
           m.horror, m.musical, m.mystery, m.romance,                                                                                                                                      
                                                                                                                                                                                           
           m.sci_fi, m.thriller, m.war, m.western                                                                                                                                          
                                                                                                                                                                                           
    FROM ratings r                                                                                                                                                                         
                                                                                                                                                                                           
    JOIN movies m ON r.movie_id = m.movie_id                                                                                                                                               
                                                                                                                                                                                           
) joined_data                                                                                                                                                                              
                                                                                                                                                                                           
LATERAL VIEW STACK(                                                                                                                                                                        
                                                                                                                                                                                           
    19,                                                                                                                                                                                    
                                                                                                                                                                                           
    'Unknown', unknown,                                                                                                                                                                    
                                                                                                                                                                                           
    'Action', action,                                                                                                                                                                      
                                                                                                                                                                                           
    'Adventure', adventure,                                                                                                                                                                
                                                                                                                                                                                           
    'Animation', animation,                                                                                                                                                                
                                                                                                                                                                                           
    'Children', children,                                                                                                                                                                  
                                                                                                                                                                                           
    'Comedy', comedy,                                                                                                                                                                      
                                                                                                                                                                                           
    'Crime', crime,                                                                                                                                                                        
                                                                                                                                                                                           
    'Documentary', documentary,                                                                                                                                                            
                                                                                                                                                                                           
    'Drama', drama,                                                                                                                                                                        
                                                                                                                                                                                           
    'Fantasy', fantasy,                                                                                                                                                                    
                                                                                                                                                                                           
    'Film-Noir', film_noir,                                                                                                                                                                
                                                                                                                                                                                           
    'Horror', horror,                                                                                                                                                                      
                                                                                                                                                                                           
    'Musical', musical,                                                                                                                                                                    
                                                                                                                                                                                           
    'Mystery', mystery,                                                                                                                                                                    
                                                                                                                                                                                           
    'Romance', romance,                                                                                                                                                                    
                                                                                                                                                                                           
    'Sci-Fi', sci_fi,                                                                                                                                                                      
                                                                                                                                                                                           
    'Thriller', thriller,                                                                                                                                                                  
                                                                                                                                                                                           
    'War', war,                                                                                                                                                                            
                                                                                                                                                                                           
    'Western', western                                                                                                                                                                     
                                                                                                                                                                                           
) genre_view AS genre, genre_flag                                                                                                                                                          
                                                                                                                                                                                           
WHERE genre_flag = 1                                                                                                                                                                       
                                                                                                                                                                                           
GROUP BY genre                                                                                                                                                                             
                                                                                                                                                                                           
ORDER BY average_rating DESC;               
