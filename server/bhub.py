from flask import Flask, jsonify, request
from flask_cors import CORS, cross_origin
import mysql.connector
import acoes

app = Flask(__name__)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'

# Conexão com o banco de dados
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="root",
  database="BHUB_TEST"
)

# Função que processará as ações necessárias para cada produto
def proc_acoes(pv_itens):
    retorno = []
    if pv_itens:
        for item in pv_itens:
            ''' bloco de prints apenas para testes de variaveis da VIEW
            print(item[0]) #PEDIDO
            print(item[1]) #DATA_PEDIDO
            print(item[2]) #COD_CLIENTE
            print(item[3]) #NOME_CLIENTE
            print(item[4]) #EMAIL_CLIENTE
            print(item[5]) #COD_PRODUTO
            print(item[6]) #NOME_PRODUTO
            print(item[7]) #QTDE_PRODUTO
            print(item[8]) #VALOR_PRODUTO
            print(item[9]) #DESC_ACAO
            print(item[10]) #FUNCAO_ACAO
            print(item[11]) #PARAMS_ACAO
            '''
            funcao = item[10]
            pv_id = item[0]
            prod_id = item[5]

            title = f"PROD.: {item[6]}"
            body = f"{item[9]} ({item[10]})"
            acao = {'title':title, 'body':body}
            #print(acao)

            #executa a ação previamente programada e testada
            getattr(acoes, funcao)(pv_id, prod_id)

            ### OBSERVAÇÃO IMPORTANTE ###
            ''' Durante o desenvolvimento percebi que ao invês de passar 
                sempre os parametros de ID do pedido e ID do produto seria
                melhor passar sempre todos os campos da VIEW
                e fazer o tratamento no modulo de processamento das ações.
                Dessa forma aumentariamos a FLEXIBILIDADE desse módulo 
                porque a VIEW poder ser implementada com novos campos (colunas)
                facilmente caso parametros adicionais sejam necessários.
                ex.:
                getattr(acoes, funcao)(item)
            '''

            retorno.append(acao)
            
    if retorno == []:
        retorno = [{'title':'Atenção', 'body':'Pedido não encontrado ou produtos sem açoes programadas'}]
    
    return retorno


### ROTAS
### O ideal é separar rotas, controllers (regras de negócio e validações) e models (bando de dados)
### para melhor organização e manutenção. O que não foi aplicado neste teste.
### Se possível, durante a próxima entrevista, apresentarei um projeto em NODE.JS com uma estrutura
### adequada para uma aplicação de grande porte.
            
# Rota para processar acoes após o pagamento de um pedido
@app.route('/processa_acoes', methods=['POST'])
@cross_origin()
def processa_acoes():
    mycursor = mydb.cursor()
    pv_id = request.json['pv_id']
    if pv_id:
        # Busca itens do pedido
        mycursor = mydb.cursor()
        print(pv_id)
        mycursor.execute("SELECT * FROM V_PV_ITENS_ACOES WHERE PEDIDO = %s", (pv_id,))
        pv_itens = mycursor.fetchall()

        retorno = proc_acoes(pv_itens)
        print(retorno)

        return jsonify(retorno)
    
    else:
        return jsonify({'error': 'Parâmetro inválido!'})

# Rota para obter todos os produtos
@app.route('/produtos', methods=['GET'])
def get_produtos():
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM T_PRODUTOS")
    produtos = mycursor.fetchall()
    return jsonify(produtos)

# Rota para obter um produto específico
@app.route('/produtos/<int:id>', methods=['GET'])
def get_produto(id):
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM T_PRODUTOS WHERE PROD_ID = %s", (id,))
    produto = mycursor.fetchone()
    return jsonify(produto)

if __name__ == '__main__':
    app.run(debug=True)