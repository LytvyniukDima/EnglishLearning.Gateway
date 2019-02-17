imageName="english_gateway"
containerName="english_gateway_service"
networkName="english-net"

docker kill $containerName
docker rm $containerName

docker run -p 5000:5000 --name $containerName --network $networkName $imageName
