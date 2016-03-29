Feature: Reserva de Vagas
  As um usuário do sistema de vagas do CIn
  I quero reservar vagas
  So eu possa estacionar o meu carro quando chegar ao CIn

Scenario: Tentar reservar quando todas vagas estão ocupadas
Given todas as vagas estão ocupadas
When Eu tento reservar uma vaga
Then O sistema não faz nenhuma reserva

Given tem apenas a vaga "11" livre
When Eu tento reservar uma vaga
Then O sistema reserva a vaga "11" para mim

Given "Eduardo" esteja logado no sistema, sem registro de idoso
And as vagas preferenciais sejam as "12" e "2016"
And apenas as vagas "11", "2016" e "6 estejam livres
When Eu tento reservar uma vaga
Then O sistema reserva a vaga "6" para mim
