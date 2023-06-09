Feature: Búsqueda de empresas remodeladoras


Scenario: Búsqueda especializada por ubicación y estilo de diseño
  Given que soy un contratante interesado en remodelar mi hogar y deseo encontrar empresas remodeladoras
  When ingreso a la aplicación y accedo a la función de búsqueda especializada
  And selecciono la ubicación geográfica deseada y el estilo de diseño preferido
  Then se me muestra una lista de empresas remodeladoras que cumplen con mis preferencias

Scenario Outline: Búsqueda especializada por ubicación y estilo de diseño
  Given soy un contratante interesado en remodelar mi hogar y deseo encontrar empresas remodeladoras
  When ingreso a la aplicación y accedo a la función de búsqueda especializada
  And selecciono la ubicación geográfica deseada "<ubicacion>" y el estilo de diseño preferido "<style>"
  Then se me muestra una lista de empresas remodeladoras que cumplen con mis preferencias

Examples:
  | ubication | style      |
  | San Miguel| Moderno     |

  Given se encuentran empresas remodeladoras que cumple con mis preferencias:
  | nombre_empresa              | ubication   | style      |
  | Constructora Rosas          | San Miguel  | Moderno     |
  | Constructora de las casas   | San Miguel  | Moderno     |
  | Constructora de Miguelaza   | San Miguel  | Moderno     |
  


Scenario: Búsqueda por ubicación geográfica
  Given que soy un contratante interesado en remodelar mi hogar y quiero encontrar empresas remodeladoras cerca de mí
  When ingreso mi ubicación geográfica en el campo de búsqueda correspondiente
  Then se me muestra una lista de empresas remodeladoras que están ubicadas en las cercanías de mi ubicación

  Scenario Outline: Búsqueda por ubicación geográfica
  Given soy un contratante interesado en remodelar mi hogar y quiero encontrar empresas remodeladoras cerca de mí
  When ingreso mi ubicación geográfica "<ubication>"
  Then se me muestra una lista de empresas remodeladoras que están ubicadas en las cercanías de mi ubicación

Examples:
  | ubication   |
  | Miraflores  |

    Given se encuentran empresas remodeladoras que cumple con mis preferencias:
  | nombre_empresa              | ubication   |
  | Constructora Lopez          | Miraflores  |
  | Remodeladoras Graña         | San Isidro  |
  | Remodeladora La Unión       | Surquillo   |

Scenario: Búsqueda sin resultados
    Given que soy un contratante interesado en remodelar mi hogar y realizo una búsqueda de empresas remodeladoras
    When ingreso mis preferencias de ubicación y estilo de diseño
    And no hay empresas remodeladoras disponibles que cumplan con mis criterios de búsqueda
    Then se me muestra un mensaje indicando que no se encontraron resultados que cumplan con mis preferencias


    Scenario Outline: Búsqueda sin resultados
    Given que soy un contratante interesado en remodelar mi hogar y realizo una búsqueda de empresas remodeladoras
    When ingreso mis preferencias de <ubication> y <style>
    And no hay empresas remodeladoras disponibles que cumplan con mis criterios de búsqueda
    Then se me muestra un <message> indicando que no se encontraron resultados que cumplan con mis preferencias

    Examples:
    | ubication | style       | message                                                      |
    | San Miguel| clasico     | No se encontraron resultados que cumplan con sus preferencias|

Scenario: Error en la recuperación de datos
    Given que soy un contratante interesado en remodelar mi hogar y realizo una búsqueda de empresas remodeladoras por ubicacion y estilo
    When los datos necesarios para realizar la búsqueda no se pueden recuperar correctamente del sistema
    Then se me muestra un mensaje de error indicando que ha ocurrido un problema y no se pueden mostrar los resultados en este momento

    Scenario Outline: Error en la recuperación de datos
    Given que soy un contratante interesado en remodelar mi hogar y realizo una búsqueda de empresas remodeladoras por <ubication> <style>
    When los datos necesarios para realizar la búsqueda no se pueden recuperar correctamente del sistema
    Then se me muestra un <message> de error indicando que ha ocurrido un problema y no se pueden mostrar los resultados en este momento

    Examples:
    | ubication | style       | message                                                      |
    | San Miguel| Moderno     | Ha ocurrido un problema, vuelve a intentarlo en unos momentos|