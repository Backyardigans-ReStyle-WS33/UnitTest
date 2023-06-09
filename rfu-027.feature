Feature: Visualización y sugerencia de cambios en el proyecto por parte del contratante

Scenario: Visualizar el progreso del proyecto
Given  que soy un contratante de un proyecto de remodelación y deseo visualizar el progreso
When  ingreso a la plataforma y accedo al proyecto correspondiente
Then se me muestra una vista general del proyecto, incluyendo tareas realizadas, avances registrados y fotos o archivos subidos 

    Scenario Outline: Visualizar el progreso del proyecto
    Given  que soy un contratante de un proyecto de remodelación y deseo visualizar el progreso
    When  ingreso a la plataforma y accedo al proyecto correspondiente
    Then se me muestra una vista general del proyecto, incluyendo "<done_tasks>", "<registered progress>" y "<photos>" o "<files>" subidos

    Examples:
    | done_tasks | registered progress | photos | files |
    | 3          | 50%                 | 2      | 1     |
    | 5          | 100%                | 3      | 2     |

Scenario: Acceder a la información del proyecto
Given que soy un contratante de un proyecto de remodelación y deseo acceder a la información relevante
When accedo al proyecto correspondiente
Then puedo ver la información del proyecto, como su nombre, descripción, fecha de inicio, fecha estimada de finalización, etc.
And puedo acceder a los detalles adicionales del proyecto, como listas de tareas, metas establecidas, recursos asignados, etc.

    Scenario Outline: Acceder a la información del proyecto
    Given que soy un contratante de un proyecto de remodelación y deseo acceder a la información relevante
    When accedo al proyecto correspondiente
    Then puedo ver la información del proyecto, como su "<name>", "<description>", "<start date>", "<estimated end date>", etc.
    And puedo acceder a los detalles adicionales del proyecto, como "<task lists>", "<goals>", "<assigned resources>", etc.

    Examples:
    | name | description | start date | estimated end date | task lists | goals | assigned resources |
    | Casa | Remodelación de casa en la colonia del valle | 01/01/2020 | 01/01/2021 | 3 | 2 | 5 |

Scenario: Realizar sugerencias de cambios o mejoras
Given que soy un contratante de un proyecto de remodelación y deseo realizar sugerencias de cambios o mejoras
When accedo al proyecto correspondiente y visualizo el progreso
And encuentro áreas en las que deseo sugerir cambios o mejoras
Then  puedo dejar comentarios o notas específicas en el proyecto, indicando mis sugerencias y explicando los motivos detrás de ellas.

    Scenario Outline: Realizar sugerencias de cambios o mejoras
    Given que soy un contratante de un proyecto de remodelación y deseo realizar sugerencias de cambios o mejoras
    When accedo al proyecto correspondiente y visualizo el progreso
    And encuentro áreas en las que deseo sugerir cambios o mejoras
    Then  puedo dejar "<comments>" o notas específicas en el proyecto, indicando mis sugerencias y explicando los motivos detrás de ellas.

    Examples:
    | comments                                               |
    | "Me gustaría que el color de la pared fuera más claro" |

Scenario:  Comunicación con la empresa remodeladora
Given que soy un contratante de un proyecto de remodelación y deseo comunicarme con la empresa remodeladora
When realizo sugerencias de cambios o mejoras en el proyecto
And envío las sugerencias a través de la plataforma
Then la empresa remodeladora puede recibir mis sugerencias y mantener una comunicación fluida para discutir los cambios propuestos y tomar decisiones conjuntas.

    Scenario Outline: Comunicación con la empresa remodeladora
    Given que soy un contratante de un proyecto de remodelación y deseo comunicarme con la empresa remodeladora
    When realizo "<comments>" en el proyecto
    And envío las sugerencias a través de la plataforma
    Then la empresa remodeladora puede recibir mis sugerencias y mantener una comunicación fluida para discutir los cambios propuestos y tomar decisiones conjuntas.

    Examples:
    | comments                                               |
    | "Me gustaría que se use otro sistema de electricidad"  |

Scenario: Confirmación de finalización del proyecto

Given que soy un contratante de un proyecto de remodelación y el proyecto ha sido finalizado
When  accedo al proyecto correspondiente y se muestra que el proyecto ha sido cerrado y dado por concluido
Then  puedo confirmar la finalización del proyecto y proporcionar mi aprobación o realizar comentarios adicionales.

    Scenario Outline: Confirmación de finalización del proyecto
    Given que soy un contratante de un proyecto de remodelación y el proyecto ha sido finalizado
    When  accedo al proyecto correspondiente y se muestra que el proyecto ha sido cerrado y dado por concluido
    Then  puedo confirmar la finalización del proyecto y proporcionar mi "<aprobation>" o realizar "<comments>" adicionales.

    Examples:
    | aprobation | comments                                               |
    | "Aprobado" | "Ha sido un proyecto increible, muchas gracias! "      |
    | "Rechazado"| "No estoy satisfecho con el resultado, necesito cambios" |
