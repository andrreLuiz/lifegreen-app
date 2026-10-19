<h1 align="center">🛒 LifeGreen - App de E-commerce</h1>

> Uma aplicação mobile completa para comércio de hortifruti desenvolvida em Flutter. O sistema inclui gestão de estado reativa com GetX, autenticação de usuários, carrinho de compras com animações, integração com backend (Parse/Back4App) e pagamentos via Pix.

## 🚀 Funcionalidades

* **Autenticação e Perfil:** Registro, login, validação de sessão por *token* seguro e recuperação de senha.
* **Catálogo Dinâmico:** Listagem de categorias e produtos com paginação e campo de pesquisa em tempo real.
* **Carrinho de Compras:** Adição de itens com animações fluídas (`add_to_cart_animation`), cálculo de totais e gestão de quantidades.
* **Checkout e Pagamentos:** Geração de pedidos com integração para pagamento via Pix (QR Code e função Copiar/Colar).
* **Histórico de Pedidos:** Acompanhamento do status da entrega (pendente, preparando, enviado, entregue) e verificação de pagamentos vencidos.

## 🛠️ Tecnologias e Pacotes Utilizados

**Frontend (Mobile):**
* ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white) - *Framework* principal para UI multiplataforma.
* ![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white) - Linguagem de programação.
* ![GetX](https://img.shields.io/badge/GetX-FF2D55?style=flat&logo=dart&logoColor=white) - Gestão de estado, navegação e injeção de dependências.

**Integração e Dados:**
* **Dio:** Cliente HTTP para comunicação com a API.
* **Freezed & JSON Serializable:** Geração de código para modelos de dados imutáveis e serialização segura.
* **Flutter Secure Storage:** Armazenamento local criptografado para *tokens* de sessão.
* **Back4App / Parse Server:** *Backend as a Service* (BaaS) utilizado para o banco de dados e funções da API.


## 📂 Estrutura do Projeto

```text
greengrocer/
├── android/                 # Arquivos nativos para compilação Android
├── assets/                  # Imagens (ex: frutas), ícones e recursos estáticos
├── ios/                     # Arquivos nativos para compilação iOS
├── lib/                     # Código principal da aplicação em Dart
│   ├── src/                 # Lógica de negócios e interface
│   │   ├── config/          # Dados estáticos (AppData) e cores globais
│   │   ├── constants/       # Endpoints da API e chaves de armazenamento
│   │   ├── models/          # Modelos de dados (User, CartItem, Order, etc.)
│   │   ├── pages/           # Telas e Controladores (GetX) divididos por módulos
│   │   │   ├── auth/        # Telas de Login, Cadastro e Recuperação
│   │   │   ├── base/        # Estrutura base com o BottomNavigationBar
│   │   │   ├── cart/        # Carrinho de compras e lógica de checkout
│   │   │   ├── common_widgets/ # Componentes visuais reutilizáveis
│   │   │   ├── home/        # Catálogo, categorias e barra de pesquisa
│   │   │   ├── orders/      # Histórico de pedidos e status de entrega
│   │   │   ├── product/     # Tela de detalhes do produto
│   │   │   ├── profile/     # Dados do usuário e alteração de senha
│   │   │   └── splash/      # Tela de abertura animada
│   │   ├── pages_routes/    # Definição e mapeamento de rotas do aplicativo
│   │   └── services/        # Gerenciador HTTP (Dio), validadores e utilitários globais
│   └── main.dart            # Ponto de entrada (Inicialização e GetMaterialApp)
├── linux/                   # Suporte para compilação Linux
├── macos/                   # Suporte para compilação macOS
├── test/                    # Testes unitários e de widgets
├── web/                     # Suporte para compilação Web
├── windows/                 # Suporte para compilação Windows
├── pubspec.yaml             # Configuração de dependências, fontes e assets do projeto
└── README.md                # Esta documentação
```

## ⚙️ Como Executar o Projeto

1. Certifique-se de ter o SDK do Flutter instalado na sua máquina.
2. Clone este repositório:
   ```bash
   git clone https://github.com/SeuUsuario/greengrocer.git
   cd greengrocer
   ```
3. Instale as dependências executando no terminal:
   ```bash
   flutter pub get
   ```
4. Execute o gerador de código (necessário para os modelos do Freezed e JSON Serializable):
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
5. Inicie a aplicação em um emulador ou dispositivo físico:
   ```bash
   flutter run
   ```