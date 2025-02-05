<p align="center">
  <img src="https://github.com/ArturMaia/Acai/blob/main/Ver-O-Peso.jpg" alt="Malha globo" style="width: 200px; border-radius: 10px;">
</p>

# Mapa de Produção de Açaí no Brasil

Este projeto tem como objetivo analisar e visualizar a produção de açaí no Brasil, levando em consideração a quantidade produzida por estado, as condições climáticas (precipitação) e os dados de mercado relacionados à área de colheita e rendimento médio ao longo dos anos. Utilizando R, este código integra diferentes fontes de dados geoespaciais e climáticos para gerar mapas interativos e gráficos informativos, proporcionando uma visão detalhada sobre a produção e o mercado do açaí.

Projeto completo disponível para visualização: [Link](https://rpubs.com/Artur_Maia/1196065)

## O projeto é composto por três principais seções:

1. **Mapa de Produção de Açaí**: Esta parte do código analisa a quantidade de açaí produzida em cada estado brasileiro em 2022. Utilizando dados geoespaciais e um mapa do Brasil, o código gera uma visualização que mostra as diferenças na produção entre os estados, usando uma paleta de cores para representar a quantidade produzida (em toneladas). Além disso, são adicionadas anotações como a seta do norte e a escala para melhor interpretação do mapa.

2. **Condição de Produção**: A segunda seção do código examina a relação entre as condições climáticas e a produção de açaí. Especificamente, é analisada a precipitação no estado do Pará, com o uso de dados climáticos globais do WorldClim. O código cria um mapa detalhado da distribuição de precipitação mensal no estado, o que é crucial para entender como o clima pode afetar a produção de açaí.

3. **Dados de Mercado**: A última seção do código trata dos dados de mercado, analisando a área colhida de açaí e o rendimento médio por hectare ao longo de vários anos (2015 a 2022). São gerados gráficos de barras e de linhas para ilustrar a evolução dessas variáveis ao longo do tempo, permitindo uma análise do desempenho do mercado de açaí em termos de área cultivada e produtividade.

O código utiliza diversas bibliotecas do R para manipulação de dados, geração de mapas e gráficos, e personalização da visualização. O objetivo final é proporcionar uma visão abrangente da produção de açaí no Brasil, relacionando dados climáticos e de mercado com a quantidade produzida e a área cultivada.

## Tecnologias Utilizadas

- **R**: Linguagem de programação utilizada para análise e visualização dos dados.
- **Pacotes R**: `sf`, `raster`, `exactextractr`, `viridis`, `tidyverse`, `geobr`, `ggspatial`, `showtext`, `rayshader`, entre outros.
- **Fontes de Dados**: Dados geoespaciais do Brasil (via `geobr`), dados climáticos de precipitação (via WorldClim) e dados de produção e mercado do açaí.

Este projeto oferece uma análise detalhada e visual das dinâmicas de produção e mercado do açaí, além de destacar a importância das condições climáticas para o setor.

## Contribuições:

Sinta-se à vontade para modificar, expandir ou adaptar este código para suas próprias necessidades. Contribuições são bem-vindas!
