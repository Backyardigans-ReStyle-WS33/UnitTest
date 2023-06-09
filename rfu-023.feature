Feature: Guardar información de una licitación del proyecto

Scenario: Guardar información de una licitación exitosamente
Given que soy un contratante interesado en un proyecto de remodelación
When ingreso a la plataforma y accedo a la función de guardar información de una licitación
And completo los campos obligatorios con los detalles de la licitación como nombre, descripción, fecha de inicio, fecha de finalización, presupuesto.
Then la información de la licitación se guarda exitosamente en el sistema


    Scenario Outline: Guardar información de una licitación exitosamente
    Given que soy un contratante interesado en un proyecto de remodelación
    When ingreso a la plataforma y accedo a la función de guardar información de una licitación
    And completo los campos obligatorios con los detalles de la licitación como <name>, <description>, <initDate>, <endDate>, <budget>.
    Then la información de la licitación se guarda exitosamente en el sistema y se muestra el mensaje <message>

    Examples:
    | Name         | description              | initDate        | endDate     | Presupuesto | Mensaje                          |
    | Licitación 1 | Proyecto de remodelación |     2023-07-01  | 2023-08-31  | $50,000     | Licitación guardada exitosamente |
    | Licitación 2 | Renovación del baño      | 2023-09-15      |  2023-10-15 | $20,000     | Licitación guardada exitosamente |
    | Licitación 3 | Ampliación de la cocina  |  2023-11-01     | 2023-12-31  | $80,000     |  Licitación guardada exitosamente|

Scenario: Visualizar información de una licitación guardada

Given que soy un contratante interesado en un proyecto de remodelación y he guardado información de una licitación
When accedo a la función de visualizar mis licitaciones guardadas
Then se me muestra una lista con las licitaciones guardadas y sus detalles

    Scenario Outline: Visualizar información de una     licitación guardada

    Given que soy un contratante interesado en un   proyecto de remodelación y he guardado información de una licitación
    When accedo a la función de visualizar mis  licitaciones guardadas
    Then se me muestra una lista con las licitaciones   guardadas y sus detalles

    Examples:
    | Nombre       | Descripción              | Fecha de inicio | Fecha de     finalización | Presupuesto |
    | Licitación 1 | Proyecto de remodelación |   2023-07-01    |       2023-08-31          | $50,000     |
    | Licitación 2 | Renovación del baño      |   2023-09-15    |     2023-10-15            | $20,000     |
    | Licitación 3 | Ampliación de la cocina  |  2023-11-01     | 2023-12-31                | $80,000     |



Scenario: Actualizar información de una licitación
Given que soy un contratante interesado en un proyecto de remodelación y he guardado información de una licitación
When accedo a la función de editar una licitación guardada
And actualizo los campos deseados con nueva información
Then la información de la licitación se actualiza exitosamente en el sistema y me muestra un mensaje indicando que así fue

    Scenario Outline: Actualizar información de una licitación

    Given que soy un contratante interesado en un   proyecto de remodelación y he guardado información    de una licitación
    When accedo a la función de editar una licitación   guardada
    And actualizo los campos deseados con nueva     información
    Then la información de la licitación se actualiza   exitosamente en el sistema y se muestra un mensaje    de confirmación

    Examples:
    | Nombre | Descripción | Fecha de inicio | Fecha de     finalización | Presupuesto |
    | Licitación A | Remodelación de la cocina |    2023-07-15 | 2023-09-30 | $25,000 |
    | Licitación B | Renovación del baño principal |    2023-08-01 | 2023-09-15 | $15,000 |
    | Licitación C | Ampliación del garaje |    2023-09-01 | 2023-11-30 | $40,000 |

Scenario:Eliminar una licitación guardada
Given que soy un contratante interesado en un proyecto de remodelación y he guardado información de una licitación
When accedo a la función de eliminar una licitación guardada
And selecciono la licitación que deseo eliminar
Then la licitación se elimina exitosamente del sistema y se muestra un mensaje confirmandolo

    Scenario Outline: Eliminar una licitación guardada

    Given que soy un contratante interesado en un   proyecto de remodelación y he guardado información    de una licitación
    When accedo a la <function> de eliminar una licitación     guardada
    And selecciono la licitación "<nombre_licitacion>"  que deseo eliminar
    Then la licitación se elimina exitosamente del  sistema y se muestra un <message> confirmandolo
    Examples:
    |function       | nombre_licitacion |  message |
    |eliminar       | Licitación A      | Licitación eliminada exitosamente |

Scenario: Error al guardar información de una licitación

Given que soy un usuario interesado en un proyecto de remodelación
When ingreso a la plataforma y accedo a la función de guardar información de una licitación
And no completo los campos obligatorios o ingreso información inválida
Then se muestra un mensaje de error indicando que la información de la licitación no se puede guardar

    Scenario Outline: Error al guardar información de una licitación

    Given que soy un usuario interesado en un proyecto  de remodelación
    When ingreso a la plataforma y accedo a la función    de guardar información de una licitación
    And no completo los campos obligatorios o ingreso     información inválida, como "<campo_incompleto>" o   "<informacion_invalida>"
    Then se muestra un mensaje de error indicando   que la información de la licitación no se puede   guardar

    Examples:
    | campo_incompleto | informacion_invalida |
    | Nombre           |    $10000            |
    | Descripción      |  Lorem ipsum         |
    | Fecha de inicio  |  2023-13-01          |
    | Fecha de finalización | 2022-05-40      |
    | Presupuesto      |   -5000              |


Scenario: Error al visualizar información de una licitación guardada

Given que soy un usuario interesado en un proyecto de remodelación
When accedo a la función de visualizar mis licitaciones guardadas
And ocurre un error al recuperar los datos del sistema
Then se muestra un mensaje de error indicando que no se pueden mostrar las licitaciones en este momento.

    Scenario Outline: Error al visualizar información de una licitación guardada

    Given que soy un usuario interesado en un proyecto  remodelación
    When accedo a la <function> de visualizar mis    itaciones guardadas
    And ocurre un error al recuperar los datos del sistema
    Then se muestra un <message> de error indicando    no se pueden mostrar las licitaciones en este     ento.

    Examples:
    | function   | message                                                |
    | visualizar | No se pueden mostrar las licitaciones en este momento. |


    
