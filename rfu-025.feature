Feature:  Generar una cotización y una propuesta visible para el contratante

Scenario: Generar cotización exitosamente
Given que soy una empresa remodeladora y deseo generar una cotización y propuesta para el contratante
When ingreso a la plataforma y accedo a la función de generar cotización
And completo los campos obligatorios con los detalles de la cotización, como descripcion, costo de materiales, costo de mano de obra, etc.
Then la cotización se genera exitosamente en el sistema
And el contratante puede ver la cotización y propuesta en su cuenta de usuario.

    Scenario Outline: Generar cotización exitosamente
    Given que soy una empresa remodeladora y deseo generar una cotización y propuesta para el contratante
    When ingreso a la plataforma y accedo a la función de generar cotización
    And completo los campos obligatorios con los detalles de la cotización, como "<description>", "<cost_of_materials>", "<cost_of_labour>", etc.
    Then la cotización se genera exitosamente en el sistema
    And el contratante puede ver la cotización y propuesta en su cuenta de usuario.

    Examples:
    | description                            | cost_of_materials | cost_of_labour | total_cost |
    | Cotizacion para remodelacion de cocina | 1000              | 2000           | 3000       |


Scenario: Error al generar cotización
Given que soy una empresa remodeladora y deseo generar una cotización y propuesta para el contratante
When intento generar la cotización en la plataforma
And ocurre un error durante el proceso de generación
Then se muestra un mensaje de error indicando que no se pudo generar la cotización

    Scenario Outline: Error al generar cotización
    Given que soy una empresa remodeladora y deseo generar una cotización y propuesta para el contratante
    When intento generar la cotización en la plataforma
    And ocurre un error durante el proceso de generación
    Then se muestra un "<message>" de error indicando que no se pudo generar la cotización

    Examples:
    | message                                                 |
    | No se pudo generar la cotización, intentelo mas tarde   |

Scenario: Campo obligatorio faltante al generar cotización
Given que soy una empresa remodeladora y deseo generar una cotización y propuesta para el contratante
When intento generar la cotización en la plataforma
And no completo uno o varios campos obligatorios necesarios para la cotización, como descripcion, costo de materiales, costo de mano de obra, etc.
Then  se muestra un mensaje indicando que los campos obligatorios deben ser completados

    Scenario Outline: Campo obligatorio faltante al generar cotización
    Given que soy una empresa remodeladora y deseo generar una cotización y propuesta para el contratante
    When intento generar la cotización en la plataforma
    And no completo uno o varios campos obligatorios necesarios para la cotización, como "<description>", "<cost_of_materials>", "<cost_of_labour>", etc.
    Then  se muestra un <message> indicando que los campos obligatorios deben ser completados

    Examples:  
    | description | cost_of_materials | cost_of_labour | total_cost | message                                                                 |
    |             | 1000              | 2000           | 3000       | El campo descripcion es obligatorio para generar la cotización           |
    | Cotizacion  |                  | 2000           | 3000       | El campo costo de materiales es obligatorio para generar la cotización   |
    | Cotizacion  | 1000              |                | 3000       | El campo costo de mano de obra es obligatorio para generar la cotización |
    | Cotizacion  | 1000              | 2000           |            | El campo costo total es obligatorio para generar la cotización           |

Scenario: Error al recuperar cotización y propuesta
Given que soy una empresa remodeladora y deseo acceder a la cotización y propuesta generadas para el contratante
When ingreso a la plataforma y accedo a la función de visualizar cotizaciones
And ocurre un error al recuperar los datos del sistema
Then se muestra un mensaje de error indicando que no se pueden mostrar las cotizaciones en este momento

    Scenario Outline: Error al recuperar cotización y propuesta
    Given que soy una empresa remodeladora y deseo acceder a la cotización y propuesta generadas para el contratante
    When ingreso a la plataforma y accedo a la función de visualizar cotizaciones
    And ocurre un error al recuperar los datos del sistema
    Then se muestra un "<message>" de error indicando que no se pueden mostrar las cotizaciones en este momento

    Examples:
    | message                                                 |
    | No se pudo recuperar la cotización, intentelo mas tarde |

Scenario: Visualizar cotización y propuesta
Given que soy un contratante y deseo ver la cotización y propuesta generadas por la empresa remodeladora
When ingreso a la plataforma y accedo a la función de visualizar cotizaciones
Then se me muestra una lista de las cotizationes generadas por la empresa remodeladora junto con su propuesta
And puedo ver los detalles de cada cotización, como descripcion, costo de materiales, costo de mano de obra, etc.

    Scenario Outline: Visualizar cotización y propuesta
    Given que soy un contratante y deseo ver la cotización y propuesta generadas por la empresa remodeladora
    When ingreso a la plataforma y accedo a la función de visualizar cotizaciones
    Then se me muestra una lista de las "<cotizations>" generadas por la empresa remodeladora junto con su "<proposal>" para descargar
    And puedo ver los detalles de cada cotización, como "<description>", "<cost_of_materials>", "<cost_of_labour>", etc.

    Examples:
    | cotizations | proposal | description                            | cost_of_materials | cost_of_labour | total_cost |
    | Cotizacion  | Propuesta| Cotizacion para remodelacion de cocina | 1000              | 2000           | 3000       |

Scenario: No se encontraron cotizaciones
Given que soy un contratante y deseo ver la cotización y propuesta generadas por la empresa remodeladora
When ingreso a la plataforma y accedo a la función de visualizar cotizaciones
And no hay cotizaciones generadas por la empresa remodeladora  
Then se muestra un mensaje indicando que no se encontraron cotizaciones.

    Scenario Outline: No se encontraron cotizaciones
    Given que soy un contratante y deseo ver la cotización y propuesta generadas por la empresa remodeladora
    When ingreso a la plataforma y accedo a la función de visualizar cotizaciones
    And no hay "<cotizations>" generadas por la empresa remodeladora  
    Then se muestra un "<message>" indicando que no se encontraron cotizaciones.

    Examples:
    | cotizations | message                                                       |
    |             | No se encontraron cotizaciones de parte de la empresa         |






