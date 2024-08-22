echo "Criando as imagens..."

docker build -t caiokievel/projeto-backend:1.0 backend/.
docker build -t caiokievel/projeto-database:1.0 database/.

echo "Realizando o push da imagens..."

docker push caiokievel/projeto-backend:1.0
docker push caiokievel/projeto-database:1.0

echo "Criando serviços no cluster Kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml
