# 📊 Dashboard de Análise de Performance para Energia Renovável

> **Aviso:** Este é um projeto de portfólio que utiliza dados fictícios gerados sinteticamente para simular um ambiente de negócios real.


---

##  Visão Geral do Projeto

Este projeto de Business Intelligence simula a análise de performance para a **"Aliança Solar & Eólica do Nordeste"**, uma empresa fictícia de energia renovável. O objetivo foi criar um dashboard estratégico completo para a diretoria, permitindo a análise de KPIs, eficiência de ativos e custos operacionais, transformando dados brutos em insights acionáveis.

---

## 🛠️ Ferramentas e Tecnologias

* **Banco de Dados:** **PostgreSQL** (hospedado na nuvem via Neon.tech)
* **Geração de Dados:** **SQL** (utilizando `generate_series` e `random()` para criar um dataset realista de ~2.200 registros de produção horária para o 1º trimestre de 2025).
* **ETL e Modelagem:** **Power Query** e Power BI Desktop.
* **Análise e Cálculos:** **DAX** (Data Analysis Expressions) para a criação de KPIs complexos.
* **Visualização de Dados:** **Power BI Desktop**.
* **Controle de Versão:** **Git & GitHub**.

---

## 🗺️ Estrutura do Dashboard

O relatório é composto por 3 páginas principais que contam uma história coesa:

### 1. Resumo Executivo
Visão macro dos KPIs mais importantes (Geração Total, Atingimento da Meta, Fator de Capacidade e Custos), tendências temporais e distribuição geográfica dos ativos.

![01_Resumo_Executivo](https://github.com/user-attachments/assets/115e86bc-6639-4c80-93d9-aa59cefcd24f)

### 2. Análise de Eficiência
Uma página comparativa para ranquear a performance de cada parque, focando no Fator de Capacidade para identificar os ativos mais e menos eficientes.

![02_Analise_Eficiencia"](https://github.com/user-attachments/assets/04ac3153-2484-4c1a-acab-699028b2036a)


### 3. Análise Operacional
Um mergulho profundo nos custos e no tempo de inatividade gerado por manutenções, separando os eventos planejados (Preventivos) dos não planejados (Corretivos) para identificar os principais riscos operacionais.

![03_Analise_Operacional](https://github.com/user-attachments/assets/c3ba385f-8f45-4817-930b-00be04b4dcc7)


---

## 🚀 Principais Insights Gerados

* **Excelência Eólica:** Os parques eólicos (Icaraí, Jeri e Delta) demonstraram uma eficiência excepcional, com Fatores de Capacidade acima de 60%, validando a estratégia de investimento nesta tecnologia.
* **Risco Operacional Concentrado:** A análise revelou que os maiores custos por falhas (manutenção corretiva) estão concentrados na Usina Solar de Mossoró e no Parque Eólico Delta, apontando-os como focos prioritários para planos de melhoria da confiabilidade.
* **Melhor Prática Identificada:** A estratégia de realizar manutenções preventivas em ativos solares durante o período noturno foi validada como altamente eficaz, zerando as perdas de produção.

---

## ⚙️ Processo de Desenvolvimento

1.  **Criação do Banco de Dados:** O esquema foi modelado e criado em PostgreSQL.
2.  **Geração de Dados Sintéticos:** Um script SQL avançado foi desenvolvido para popular o banco de dados com dados horários realistas para um trimestre completo.
3.  **Conexão e ETL:** Os dados foram conectados ao Power BI via Power Query, onde foram realizadas as verificações de tipo de dados e a limpeza inicial.
4.  **Modelagem e DAX:** Foi criado um modelo *Star Schema* e desenvolvidas diversas medidas em DAX para calcular os KPIs do projeto.
5.  **Versionamento:** O código-fonte do projeto (arquivos `.pbip`, scripts `SQL` e documentação) foi versionado com Git e hospedado no GitHub.

---

## 📂 Estrutura do Repositório

* **/Projeto_PowerBI:** Contém o código-fonte do relatório em formato Power BI Project (`.pbip`), permitindo o controle de versão detalhado do modelo de dados e do layout do relatório.
* **/SQL:** Armazena os scripts SQL utilizados para a criação do schema do banco de dados e para a geração dos dados sintéticos.
* **/Documentacao:** Inclui imagens do dashboard e outros artefatos de documentação do projeto.
