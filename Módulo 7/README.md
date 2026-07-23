<div class="hero-image">
    <div class="frame">
        <img src="assets/brunoschaden.png" alt="Fundamentos da Computação em Nuvem">
    </div>
</div>

# Módulo 7 - Fundamentos da Computação em Nuvem
Anotações da aula sobre os fundamentos de Cloud Computing: definição técnica, características essenciais, modelos de serviço e de implantação, e como isso se aplica no dia a dia de quem trabalha com dados. Instrutor: Bruno Schaden, Team Lead Analytics Engineer na Indicium.

## O que já era esperado como pré-requisito

A aula não citou pré-requisitos técnicos formais — o Bruno partiu do zero, explicando cloud como conceito antes de entrar em qualquer provedor específico (AWS, Azure, GCP). Ajuda ter uma noção geral de infraestrutura (servidor, rede, armazenamento), mas não é obrigatório.

O foco da aula foi entender **o que é** cloud computing de fato — não ficar só na piada de "é o computador de outra pessoa" — e como ela se estrutura em características, modelos de serviço e modelos de implantação.

## O que aprendi

**Cloud não é só "o computador de outra pessoa"**

Essa piada (que o Bruno trouxe cheia de memes do LinkedIn) até ajuda a entender a ideia geral, mas é simplista demais. Ter um servidor remoto ou um data center terceirizado **não é**, necessariamente, cloud. Pra ser cloud de verdade, o serviço precisa bater as características essenciais definidas tecnicamente (ver abaixo).

**A definição técnica (NIST)**

A definição usada como base na aula vem do NIST (National Institute of Standards and Technology, dos EUA), no documento SP 800-145:

> A computação em nuvem é um modelo que permite um acesso amplo, conveniente e sob demanda via rede, a um conjunto compartilhado de recursos de computação configuráveis (redes, servidores, armazenamento, aplicativos e serviços), que podem ser rapidamente provisionados e liberados com mínimo esforço de gerenciamento ou interação do provedor de serviço.

Essa definição já entrega a estrutura toda da aula: **5 características essenciais**, **3 modelos de serviço** e **4 modelos de implantação**.

**Cloud em uma frase prática**

Cloud é computação como utilidade — igual energia elétrica. Você não compra a usina, paga pela energia que consome. Em cloud, você paga por compute, storage e rede conforme usa, e não pelo hardware em si.

## As 5 características essenciais

| Característica | O que significa na prática |
|---|---|
| **Autosserviço sob demanda** | Eu mesmo provisiono o que preciso (mais RAM, mais storage) sem precisar que alguém do provedor faça isso manualmente pra mim |
| **Amplo acesso via rede** | Acesso de qualquer lugar com internet, independente de dispositivo ou plataforma |
| **Agrupamento de recursos** | O provedor concentra os recursos (pool) e ajusta o provisionamento conforme a demanda de todos os clientes |
| **Consumo medido de serviço** | Cobrança conforme o uso real — se aloco 10GB mas uso 4GB, pago pelos 4GB |
| **Elasticidade rápida** | O recurso já está disponível, é só alocar — RAM/storage aumentam ou diminuem em segundos, sem trocar hardware fisicamente |

## Os 3 modelos de serviço

| Modelo | Analogia do Bruno | O que o provedor cuida | O que eu cuido |
|---|---|---|---|
| **IaaS** (Infrastructure as a Service) | Alugar um terreno vazio — faço o que eu quiser nele | Rede, servidor físico, virtualização | SO, containers, runtime, dados, aplicação |
| **PaaS** (Platform as a Service) | Alugar uma cozinha industrial pronta — só chego e cozinho | Tudo até o runtime | Dados e aplicação |
| **SaaS** (Software as a Service) | Pedir comida pelo app — só uso | Praticamente tudo | Só uso e configuro |

Exemplos citados: **SaaS** → Google Apps, Facebook, YouTube, Salesforce. **PaaS** → Microsoft Azure, Google App Engine, Amazon SimpleDB/S3. **IaaS** → Amazon EC2, GoGrid, Flexiscale.

Comparando com **On-Premise** (minha máquina local, onde eu cuido de tudo — aplicação, dados, runtime, containers, SO, virtualização, servidor físico e rede), dá pra ver visualmente o quanto cada modelo tira responsabilidade de gerenciamento de mim e passa pro provedor.

## Os 4 modelos de implantação

- **Pública** → Azure, AWS, GCP. Foco em velocidade, escala e catálogo de serviços. O provedor cuida de tudo, eu só pago pelo uso.
- **Privada** → infraestrutura minha, controle extremo, geralmente um sistema mais legado dentro do meu próprio escritório/data center. Faz sentido, por exemplo, quando há restrição legal de onde os dados podem ficar armazenados.
- **Híbrida** → mistura de privada + pública. Uso a privada pra dados sensíveis (baixa latência, compliance) e a pública pra dados transacionais gerais que precisam de mais poder de processamento. Ferramentas citadas pra isso: Azure Stack, AWS Outposts e Anthos (do Google).
- **Multicloud** → uso serviços específicos de mais de um provedor público ao mesmo tempo (ex: dados no GCP + data lake na AWS), pra aproveitar o que cada um tem de melhor. Aumenta a complexidade, mas pode compensar dependendo do modelo de negócio.

## Vantagens operacionais da cloud

O Bruno listou 5 pilares de vantagem operacional: **Provisionamento, Conectividade, Controle de Acesso, Monitoramento e Orquestração**.

- **Provisionamento** → na infra tradicional, comprar e configurar um servidor levava dias/semanas/meses. Na cloud, isso acontece em minutos, só clicando.
- **Conectividade** → não basta criar uma máquina virtual, é preciso definir quem pode se conectar, por qual caminho e com quais restrições (ex: VPN com SSO via conta Google/Microsoft) — isso é uma barreira de segurança forte contra acesso não autorizado.
- **Controle de acesso** → determina quem (ou o quê, no caso de uma conta de serviço) pode acessar um recurso e quais operações pode realizar nele. O conceito central aqui é o de **acesso mínimo** (least privilege): dar só a permissão necessária pra pessoa/serviço fazer o trabalho dela, nada além disso. O Bruno deu o próprio exemplo: usou uma conta admin num projeto pessoal e acabou apagando o banco de dados inteiro sem querer — se tivesse usado uma conta com acesso restrito (só leitura/escrita nas tabelas certas, sem permissão de `DROP`), isso não teria acontecido. Na nuvem, esse controle é administrado por sistemas de **IAM** (Identity and Access Management).
- **Monitoramento** → acompanhamento contínuo de estado, desempenho, segurança e consumo dos recursos. Tem ligação direta com custo: se eu aumento a capacidade de processamento (ex: pra acelerar uma transformação de dados) e esqueço aquilo ligado, a fatura no fim do mês vem bem mais alta do que eu esperava. Monitorar é o que evita esse tipo de susto.
- **Orquestração** → coordenação automática de vários recursos, serviços e tarefas funcionando como um processo único (a analogia é literal: uma orquestra). Diferente de uma automação isolada (que executa uma tarefa só), a orquestração organiza várias automações, respeita as dependências entre elas (o que precisa terminar antes de outra coisa começar), dispara a próxima tarefa automaticamente quando a anterior termina, e tem uma boa resposta a falhas: se algo quebra no meio do processo, o resto não é executado, e dá pra saber exatamente onde e por que falhou.

## Provedores Cloud

O Bruno frisou que 95-96% do tempo a gente lida só com **clouds públicas** (AWS, Azure, GCP), então o foco foi nelas. Pra acessar os recursos de um provedor, quatro conceitos aparecem sempre: Conta, Regiões, Zonas e VPC.

**Conta** → é o ambiente administrativo onde organizo tudo que tenho na cloud: usuários, grupos, assinaturas, departamentos, ambientes separados. É um acesso extremamente restrito, mas que enxerga e controla tudo — a analogia do Bruno foi "o presidente do teu serviço".

**Regiões** → localização geográfica onde o serviço fica hospedado. A escolha da região importa por três motivos:
- **Preço** → regiões com data centers maiores custam menos. Exemplo citado: armazenar dados em São Paulo custava, na última verificação, quase o dobro do preço de armazenar no US East 1 (Virgínia).
- **Latência** → quanto mais longe fisicamente a região, maior o tempo de resposta (o "lag"). Se a aplicação não depende de tempo real, isso pode não importar; se depende, é um fator decisivo na escolha entre, por exemplo, São Paulo e Virgínia.
- **Segurança/regulação** → é preciso escolher bem onde os dados ficam. Riscos físicos existem (um desastre natural, uma manutenção que trava a região inteira) e, no caso do Brasil, há legislação que restringe o armazenamento de dados pessoais fora do país — o que pode tornar uma cloud privada local mais viável que uma pública no exterior, dependendo do caso.

Uma região não é "um prédio só": é uma estrutura geográfica formada por vários data centers diferentes que se comunicam entre si. Os provedores usam códigos padronizados pra identificar cada uma (ex: `sa-east-1`, `us-east-1`, `eu-west-1`), o que já entrega de cara onde ela fica.

**Zonas** (Availability Zones) → subdivisões independentes dentro de uma região. O objetivo principal é **isolamento de falhas**: se a zona A falha ou entra em manutenção, a zona B continua ativa atendendo os usuários, então uma aplicação distribuída entre múltiplas zonas absorve a falha local sem ficar fora do ar. Importante: as zonas **não** são isoladas por completo — elas são interligadas por redes de alta velocidade e baixa latência, o que permite configurar uma VPC conversando entre mais de uma zona.

**VPC** (Virtual Private Cloud) → minha rede privada virtual dentro da cloud, isolada dos outros clientes do provedor. Na prática, funciona como uma espécie de VPN pensada pra cloud.

## Ranking de provedores cloud (dados estimados até Q4/2025)

| Provedor | Regiões | Zonas | Market Share |
|---|---|---|---|
| Amazon Web Services (AWS) | 39 | 123 | 28% |
| Microsoft Azure | 70+ | 126+ | 21% |
| Google Cloud Platform (GCP) | 42 | 127 | 14% |
| Alibaba Cloud | 29 | 94 | 4% |
| Oracle Cloud | 45 | 55 | 3% |
| IBM Cloud | 13 | 39 | 2% |
| Tencent Cloud | 22 | 64 | 2% |
| OVHcloud | 19 | 23 | <1% |
| DigitalOcean | 9 | 13 | <1% |
| Linode | 31 | 31 | <1% |

## Pra lembrar depois

- Cloud só é cloud de verdade se bater as 5 características essenciais — ter servidor remoto ou data center terceirizado não basta
- A definição do NIST é a referência técnica: 5 características, 3 modelos de serviço, 4 modelos de implantação
- IaaS = terreno vazio, PaaS = cozinha industrial pronta, SaaS = pedir comida no app — quanto mais alto na pilha, menos eu gerencio
- Os 4 modelos de implantação (pública, privada, híbrida, multicloud) resolvem necessidades diferentes de controle, custo e compliance
- Provisionamento, conectividade, controle de acesso (IAM + acesso mínimo), monitoramento e orquestração são as 5 vantagens operacionais da cloud frente ao on-premise
- Escolher região é um trade-off entre preço, latência e segurança/regulação — não é só "pegar a mais barata"
- Zonas existem pra isolar falhas: uma zona cair não deve derrubar a aplicação inteira, já que elas ficam interligadas por rede de alta velocidade
- AWS lidera em market share (~28%), mas Azure tem mais regiões — cada provedor tem pontos fortes diferentes
