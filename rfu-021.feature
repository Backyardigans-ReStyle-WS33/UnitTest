Feature: Agendar citas con una empresa remodeladora

Scenario: Agendar una cita exitosamente
Given que soy un contratante registrado en la plataforma 
When accedo a la función de agendar citas
And seleccione una fecha y hora disponible para agendar mi cita con una empresa remodeladora 
Then se muestra un mensaje donde se indica que mi cita se ha registrado exitosamente en el sistema

    Scenario Outline: Agendar una cita exitosamente
    Given que soy un contratante registrado en la plataforma 
    When accedo a la <function> de agendar citas
    And seleccione una <date> y <hour> disponible para agendar mi cita con una empresa remodeladora
    Then se muestra un <message> donde se indica que mi cita se ha registrado exitosamente en el sistema

    Examples:
    | function      | date       | hour  | message                                             |
    | agendar citas | 2021-10-10 | 10:00 | Su cita se ha registrado exitosamente en el sistema |
    | agendar citas | 2021-10-10 | 11:00 | Su cita se ha registrado exitosamente en el sistema |

Scenario: Mostrar disponibilidad de citas
Given que soy un contratante registrado en la plataforma 
When accedo a la función de agendar citas
And selecciono una empresa remodeladora específica
Then se me muestra una lista con la disponibilidad de citas de la empresa para las fechas y horas disponibles

    Scenario Outline: Mostrar disponibilidad de citas
    Given que soy un contratante registrado en la plataforma 
    When accedo a la <function> de agendar citas
    And selecciono una <company> específica
    Then se me muestra una lista con la <availability> de citas de la empresa para las <date> y <hour> disponibles

    Examples:
    | function      | company               | availability | date       | hour  |
    | agendar citas | RemodladoraRosas      | 10:00        | 2021-10-10 | 10:00 |
    | agendar citas | RemodladoraRosas      | 11:00        | 2021-10-10 | 11:00 |
    | agendar citas | ConstructoraCopertino | 11:00        | 2021-10-10 | 11:00 |  



Scenario: Cancelar una cita
Given que soy un contratante registrado en la plataforma y tengo una cita previamente agendada 
When accedo a la función de cancelar citas
And seleccione la cita que deseo cancelar
Then se me muestra un mensaje que indica que la cita ha sido cancelada exitosamente

    Scenario Outline: Cancelar una cita
    Given que soy un contratante registrado en la plataforma y tengo una cita previamente agendada 
    When accedo a la <function> de cancelar citas
    And seleccione la <appointment> que deseo cancelar
    Then se me muestra un <message> que indica que la cita ha sido cancelada exitosamente

    Examples:
    | function        | appointment                         | message                                |
    | cancelar citas  | Cita con Remodeladora Cáceres       | Su cita ha sido cancelada exitosamente |      
    | cancelar citas  | Cita con Constructora Copertino     | Su cita ha sido cancelada exitosamente |

Scenario:Reprogramar una cita
Given ue soy un contratante registrado en la plataforma y tengo una cita previamente agendada  
When accedo a la función de reprogramar citas
And selecciono la cita que deseo reprogramar 
And selecciono una nueva fecha y hora disponible para la cita
Then  se me muestra un mensaje que indica que la cita ha sido reprogramada exitosamente

    Scenario Outline: Reprogramar una cita
    Given que soy un contratante registrado en la plataforma y tengo una cita previamente agendada  
    When accedo a la <function> de reprogramar citas
    And selecciono la <appointment> que deseo reprogramar
    And selecciono una nueva <date> y <hour> disponible para la cita
    Then  se me muestra un <message> que indica que la cita ha sido reprogramada exitosamente

    Examples:
    | function           | appointment                         | date       | hour  | message                                   |
    | reprogramar citas  | Cita con Remodeladora Cáceres       | 2021-10-10 | 10:00 | Su cita ha sido reprogramada exitosamente |
    | reprogramar citas  | Cita con Constructora Copertino     | 2021-10-10 | 11:00 | Su cita ha sido reprogramada exitosamente |

Scenario: Error al agendar una cita
Given que soy un contratante registrado en la plataforma 
When accedo a la función de agendar citas
And selecciono una fecha y hora que ya está ocupada por otra cita
Then se me muestra un mensaje de error indicando que la fecha y hora seleccionada no están disponibles

    Scenario Outline: Error al agendar una cita
    Given que soy un contratante registrado en la plataforma 
    When accedo a la <function> de agendar citas
    And selecciono una <date> y <hour> que ya está ocupada por otra cita
    Then se me muestra un <message> de error indicando que la fecha y hora seleccionada no están disponibles

    Examples:
    | function      | date       | hour  | message                                             |
    | agendar citas | 2021-10-10 | 10:00 | La fecha y hora seleccionada no están disponibles   |
    | agendar citas | 2021-10-10 | 11:00 | La fecha y hora seleccionada no están disponibles   |

Scenario: Error al cancelar una cita
Given que soy un contratante registrado en la plataforma y tengo una cita previamente agendada 
When accedo a la función de cancelar citas
Then se me muestra un mensaje de error indicando que la cita no se puede cancelar


    Scenario Outline: Error al cancelar una cita
    Given que soy un contratante registrado en la plataforma y tengo una cita previamente agendada 
    When accedo a la <function> de cancelar citas
    Then se me muestra un <message> de error indicando que la cita no se puede cancelar

    Examples:
    | function        | message                                 |
    | cancelar citas  | La cita no se puede cancelar            |      
    | cancelar citas  | La cita no se puede cancelar            |


