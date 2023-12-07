/* Teste simples da API processa_acoes */
const apiUrl = 'http://127.0.0.1:5000/processa_acoes';
const errorDiv = document.getElementById("erro-servidor")

// Function to fetch data from the API
async function fetchData(pv_id) {
  const data = { pv_id };
  const requestOptions = {
    method: 'POST',
    headers: {'Content-Type': 'application/json'},
    body: JSON.stringify(data),
  };

  try {
      errorDiv.style.display = 'none';
      const response = await fetch(apiUrl, requestOptions);
      const data = await response.json();
      return data;
  } catch (error) {
      errorDiv.style.display = 'block';
      console.error('Error fetching data:', error);
  }
}

// Function to render data in cards
async function renderData(pv_id) {
  const container = document.querySelector('.container');
  container.innerHTML = '';
  const data = await fetchData(pv_id);

  if (!data) {
      return;
  }

  data.forEach(item => {
      const card = document.createElement('div');
      card.classList.add('card');

      const title = document.createElement('h2');
      title.textContent = item.title;

      const body = document.createElement('p');
      body.textContent = item.body;

      card.appendChild(title);
      card.appendChild(body);
      container.appendChild(card);
  });
}

// Código JS para pegar número do pedido e processar ações
const inputBtn = document.getElementById("proc_btn");
const inputEl = document.getElementById("pv_input");

function processa_acoes() {
  renderData(inputEl.value);
}
inputBtn.addEventListener("click", processa_acoes);
