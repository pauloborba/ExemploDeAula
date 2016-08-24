Feature: Reserva de Vagas
  As um usuário do sistema de vagas do CIn
  I quero reservar vagas
  So eu possa estacionar o meu carro quando chegar ao CIn

Scenario: Tentar reservar quando todas vagas estão ocupadas
Given todas as vagas estão ocupadas
When Eu tento reservar uma vaga
Then O sistema não faz nenhuma reserva
And Não altera as reservas existentes

Scenario: Tentar reservar quando apenas uma vaga está livre
Given tem apenas a vaga "12" livre
When Eu tento reservar uma vaga
Then O sistema reserva a vaga "12" para mim

Scenario: Tentar reservar com apenas uma vaga não preferencial livre
Given "Eduardo" esteja logado no sistema, sem registro de idoso
And as vagas preferenciais sejam as "12" e "2016"
And apenas as vagas "12", "2016" e "6" estejam livres
When Eu tento reservar uma vaga
Then O sistema reserva a vaga "6" para mim

  Scenario: Tentar reservar sem vaga não preferencial livre
    Given "Eduardo" esteja logado no sistema, sem registro de idoso
    And as vagas preferenciais sejam as "12" e "16"
    And apenas as vagas "13" e "16" estejam livres
    When Eu tento reservar uma vaga
    Then O sistema não faz nenhuma reserva

Scenario: Idoso tentar reservar só com vaga preferencial livre
Given "Eduardo" esteja logado no sistema, com registro de idoso
And as vagas preferenciais sejam as "12" e "2016"
And apenas as vagas "12" e "2016" estejam livres
When Eu tento reservar uma vaga
Then O sistema reserva a vaga "12" para mim
