<h1 align="center">Desafio BeMobile</h1>
<p align="center">Projeto desenvolvido com o intuito de mostrar e gerenciar usuários cadastrados em um banco de dados. Podendo pesquisá-los por <strong>Nome</strong>, 
<strong>Cargo</strong> e <strong>Telefone</strong></p>

<h1 align="center">:sparkles: Tecnologias</h1>
<p align="center">Esse projeto foi desenvolvido com</h1>
<br />

<p align="center"><a href="https://flutter.dev/">Flutter</a></p>
<p align="center"><a href="https://dart.dev/">Dart</a></p>


<h1 align="center">:ballot_box_with_check: Layout</h1>
<p align="center">Caso você queira ver o layout desse projeto, basta clicar <a href="https://www.figma.com/design/Lpdera6rS8SztMUAwzkpN0/Teste-Técnico-Mobile-BeTalent?node-id=1-3&node-type=canvas&t=vYuDRPdDFtgWU8Og-0">aqui</a> para ir ao <strong>figma</strong> e observar com mais detalhes :)</p>

<h1 align="center">:sparkles: Pré-Requisitos</h1>

<p align="center">Antes de rodar a aplicação, você precisará atender aos seguintes pré-requisitos:</p>

1. **Instalar e configurar o Flutter**
   <p align="center">Este projeto foi desenvolvido utilizando a versão <strong>Flutter 3.24.3</strong>. Você pode seguir as instruções de instalação no link abaixo:</p>

     <li><a href="https://flutter.dev/docs/get-started/install">Instalação do Flutter</a> (incluindo o SDK do Dart)</li>

   <p align="center">Certifique-se também de ter um emulador ou dispositivo físico configurado para rodar aplicativos Flutter.</p>

2. **Instalar o JSON Server**
   <p align="center">O projeto utiliza o <strong>JSON Server</strong> para simular uma API REST. Para instalá-lo, use o seguinte comando no terminal:</p>
   <pre><strong>$ npm install -g json-server</strong></pre>

   <p align="center">Depois de instalado, você pode rodar o JSON Server apontando para o arquivo <strong>database.json</strong> presente em <strong>lib/data/database.json</strong>. Use o comando abaixo para iniciar o servidor:</p>
   <pre><strong>$ json-server --watch lib/data/database.json</strong></pre>

3. **Atenção à porta utilizada pelo JSON Server**
   <p align="center">Por padrão, o JSON Server roda na porta <strong>3000</strong>. No entanto, é possível que ele rode em outra porta se a 3000 já estiver em uso. Certifique-se de verificar qual porta está sendo utilizada no terminal ao iniciar o servidor.</p>

   <p align="center">Se o JSON Server rodar em uma porta diferente, altere a variável <strong>API_BASE_URL</strong> no arquivo <strong>constants.dart</strong>:</p>
   
   ```dart
   class Constants {
     static const API_BASE_URL = "http://10.0.2.2:PORTA_UTILIZADA";
   }


<h1 align="center">:rocket: Executando o Projeto</h1>
<p align="center">Comece clonando o repositório para sua máquina, usando</p>
<pre><strong>$ git clone https://https://github.com/Joao-Kleber-Linhalis/BeTalent-desafio-mobile</strong></pre>

<p align="center">Após isso, vá até a pasta do projeto</p>
<pre><strong>$ cd BeTalent-desafio-mobile</strong></pre>

<p align="center">Instale todas as dependências, usando o seu gerenciador de pacotes preferido</p>
<pre><strong>$ flutter pub get</strong></pre>

<p align="center">Para rodar o projeto, certifique-se de que um dispositivo ou emulador está conectado e configurado corretamente. Para iniciar o projeto, use</p>
<pre><strong>$ flutter run</strong></pre>

<p align="center">Agora, o projeto está pronto para ser utilizado!</p>
