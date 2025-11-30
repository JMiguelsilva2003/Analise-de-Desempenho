echo "Iniciando testes de carga..."

for i in {1..10}
do
    echo -n "Requisição $i: "
    curl http://localhost:8080
done