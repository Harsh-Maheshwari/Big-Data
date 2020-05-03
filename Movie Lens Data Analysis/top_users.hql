SELECT userid, count(userid) as cnt FROM ratings_data GROUP BY usrid HAVING cnt >'${hivevar:score}'  ORDER BY cnt; 
