USE movielens_manya_chourasiya;                                                                                                                                                            
                                                                                                                                                                                           
                                                                                                                                                                                           
                                                                                                                                                                                           
SELECT                                                                                                                                                                                     
                                                                                                                                                                                           
    m.movie_id,                                                                                                                                                                            
                                                                                                                                                                                           
    m.title,                                                                                                                                                                               
                                                                                                                                                                                           
    COUNT(r.rating) AS rating_count,                                                                                                                                                       
                                                                                                                                                                                           
    AVG(r.rating) AS avg_rating                                                                                                                                                            
                                                                                                                                                                                           
FROM ratings r                                                                                                                                                                             
                                                                                                                                                                                           
JOIN movies m                                                                                                                                                                              
                                                                                                                                                                                           
    ON r.movie_id = m.movie_id                                                                                                                                                             
                                                                                                                                                                                           
GROUP BY m.movie_id, m.title                                                                                                                                                               
                                                                                                                                                                                           
HAVING COUNT(r.rating) >= 100                                                                                                                                                              
                                                                                                                                                                                           
ORDER BY avg_rating DESC                                                                                                                                                                   
                                                                                                                                                                                           
LIMIT 10;                                     
