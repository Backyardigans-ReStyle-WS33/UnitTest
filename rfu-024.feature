Feature:Almacenar información de análisis en base a la licitación del proyecto

Scenario: Almacenar información de análisis exitosamente
Given que soy una empresa remodeladora y he realizado un análisis en base a la licitación del proyecto
When ingreso a la plataforma y accedo a la función de almacenar análisis
And completo los campos obligatorios con los detalles del análisis, como nombre, descripción, fecha, conclusiones, etc.
Then El sistema almacena la información de análisis exitosamente

    Scenario Outline: Almacenar información de análisis exitosamente
    Given que soy una empresa remodeladora y he realizado un análisis en base a la licitación del proyecto
    When ingreso a la plataforma y accedo a la <function> de almacenar análisis
    And completo los campos obligatorios con los detalles del análisis, como <name>, <description>, <date>, <conclusions>, etc.
    Then El sistema almacena la información de análisis exitosamente y muestra un mensaje de confirmación

    Examples:
    | function | name | description | date | conclusions |
    | almacenar análisis | Análisis de la licitación | Análisis de la licitación para el proyecto de remodelación de la casa de la familia Pérez | 10/10/2020 | Se requiere un presupuesto de $10000 para realizar la remodelación de la casa de la familia Pérez |


Scenario: Error al almacenar información de análisis 
Given que soy una empresa remodeladora y he realizado un análisis en base a la licitación del proyecto 
When intento almacenar el análisis en la plataforma 
And ocurre un error durante el proceso de almacenamiento 
Then se muestra un mensaje de error indicando que no se pudo guardar la información del análisis.

    Scenario Outline: Error al almacenar información de análisis
    Given que soy una empresa remodeladora y he realizado un análisis en base a la licitación del proyecto
    When intento almacenar el análisis en la plataforma
    And ocurre un error durante el proceso de almacenamiento
    Then se muestra un <message> de error indicando que no se pudo guardar la información del análisis.

    Examples:
    
    | message                                  |
    | error, no se pudo guardar la información |

Scenario: Campo obligatorio faltante al almacenar análisis 
Given que soy una empresa remodeladora y he realizado un análisis en base a la licitación del proyecto
When intento almacenar el análisis en la plataforma 
And no completo uno o varios campos obligatorios necesarios para el análisis
Then se muestra un mensaje de error indicando que los campos obligatorios deben ser completados.

    Scenario Outline: Campo obligatorio faltante al almacenar análisis
    Given que soy una empresa remodeladora y he realizado un análisis en base a la licitación del proyecto
    When intento almacenar el análisis en la plataforma
    And no completo uno o varios <fields> obligatorios necesarios para el análisis
    Then se muestra un <message> de error indicando que los campos obligatorios deben ser completados.

    Examples:
    | fields | message                                  |
    | name   | error, el campo name debe ser rellenado  |
    | date   | error, el campo date debe ser rellenado  |


Scenario: Error al recuperar información de análisis 
Given que soy una empresa remodeladora y deseo acceder a la información de un análisis almacenado
When  ingreso a la plataforma y accedo a la función de visualizar análisis almacenados
And ocurre un error al recuperar los datos del sistema
Then se muestra un mensaje de error indicando que no se pueden mostrar los análisis en este momento.

    Scenario Outline: Error al recuperar información de análisis
    Given que soy una empresa remodeladora y deseo acceder a la información de un análisis almacenado
    When  ingreso a la plataforma y accedo a la función de visualizar análisis almacenados
    And ocurre un <error> al recuperar los datos del sistema
    Then se muestra un <message> de error indicando que no se pueden mostrar los análisis en este momento.

    Examples:
    | error | message                                  |
    | error | error, no se pueden mostrar los análisis |

Scenario: Visualizar información de análisis almacenado 
Given que soy una empresa remodeladora y he almacenado información de análisis en la plataforma 
When  accedo a la función de visualizar análisis almacenados 
Then se me muestra una lista con los análisis almacenados y puedo ver los detalles de cada análisis, como nombre, descripción, fecha, conclusiones, etc.

    Scenario Outline: Visualizar información de análisis almacenado
    Given que soy una empresa remodeladora y he almacenado información de análisis en la plataforma
    When  accedo a la función de visualizar análisis almacenados
    Then se me muestra una lista con los análisis almacenados y puedo ver los detalles de cada análisis, como <name>, <description>, <date>, <conclusions>, etc.

    Examples:
    | name | description | date | conclusions |
    | Análisis de la licitación | Análisis de la licitación para el proyecto de remodelación de la casa de la familia Pérez | 10/10/2020 | Se requiere un presupuesto de $10000 para realizar la remodelación de la casa de la familia Pérez |


Scenario: No se encontraron análisis almacenados 
Given que soy una empresa remodeladora y deseo acceder a la información de un análisis almacenado 
When ingreso a la plataforma y accedo a la función de visualizar análisis almacenados 
And no hay análisis almacenados en el sistema 
Then se muestra un mensaje indicando que no se encontraron análisis almacenados

    Scenario Outline: No se encontraron análisis almacenados
    Given que soy una empresa remodeladora y deseo acceder a la información de un análisis almacenado
    When ingreso a la plataforma y accedo a la función de visualizar análisis almacenados
    And no hay análisis almacenados en el sistema
    Then se muestra un <message> indicando que no se encontraron análisis almacenados

    Examples:
    | message                                  |
    | No se encontraron análisis almacenados   |
