curl -X DELETE "https://api.cloudflare.com/client/v4/zones/0a8592e19043287ad80356099a1586ea/purge_cache" \
-H "Content-Type:application/json" \
-H "X-Auth-Key:e137d9503f139cc97f487e4a1812c5887a439" \
-H "X-Auth-Email:dave.kopecek@gmail.com" \
--data '{"purge_everything":true}'
