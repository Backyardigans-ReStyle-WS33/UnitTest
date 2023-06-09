Feature: Manejo y seguimiento de un proyecto por parte de la empresa remodeladora

Scenario: Crear un nuevo proyecto

Given  soy una empresa remodeladora y deseo crear un nuevo proyecto de remodelación
When accedo a la función de crear proyecto
And completo los campos obligatorios, como el nombre, la descripcion, las fechas, el estado,etc.
Then se crea exitosamente un nuevo proyecto en el sistema y puedo agregar tareas, establecer metas, subir fotos o archivos relacionados, y gestionar los recursos del proyecto.

    Scenario Outline: : Crear un nuevo proyecto 
    Given  soy una empresa remodeladora y deseo crear un nuevo proyecto de remodelación
    When accedo a la función de crear proyecto
    And completo los campos obligatorios, como "<name_project>", "<description>", "<start_date>", "<end_date>","<budget>","<state>".
    Then se crea exitosamente un nuevo proyecto en el sistema y puedo agregar tareas, establecer metas, subir fotos o archivos relacionados, y gestionar los recursos del proyecto.

    Examples:

    | name_project                       | description                         | start_date | end_date   | budget  | state     |
    | Proyecto Remodelacion Dormitorio   | Remodelacion de dormitorio de 20 m2 | 01/01/2020 | 01/02/2020 | 1000000 | En Proceso |


Scenario: Gestionar tareas del proyecto

Given que soy una empresa remodeladora y estoy en un proyecto de remodelación
When accedo a la función de gestionar tareas del proyecto
And puedo agregar, editar o eliminar tareas relacionadas con el proyecto
Then puedo mantener un registro de las tareas a realizar, asignar responsables, establecer fechas límite y actualizar el estado de las tareas según su progreso.

    Scenario Outline: Gestionar tareas del proyecto
    Given que soy una empresa remodeladora y estoy en un proyecto de remodelación
    When accedo a la función de gestionar tareas del proyecto
    And puedo realizar diversas "<functions>" como agregar, editar o eliminar tareas relacionadas con el proyecto
    Then puedo mantener un registro de las tareas a realizar, asignar responsables, establecer fechas límite y actualizar el estado de las tareas según su progreso.

    Examples:
    | functions |
    | agregar   |
    | editar    |
    | eliminar  |


Scenario: Registrar avances y subir fotos o archivos

Given que soy una empresa remodeladora y estoy en un proyecto de remodelación
When accedo a la funcion de registrar avances y subir fotos o archivos
And puedo registrar los avances realizados en el proyecto, como descripciones de trabajo realizado, fechas, recursos utilizados, etc.
And puedo subir fotos o archivos relacionados con el proyecto para documentación y seguimiento.
Then puedo mantener un registro detallado del progreso y los cambios realizados en el proyecto.

    Scenario Outline: Registrar avances y subir fotos o archivos
    Given que soy una empresa remodeladora y estoy en un proyecto de remodelación
    When accedo a la "<function>" de registrar avances y subir fotos o archivos
    And puedo registrar los avances realizados en el proyecto, como "<descriptions_of_work>", "<dates>", "<resources_used>", etc.
    Then puedo mantener un registro detallado del progreso y los cambios realizados en el proyecto.

    Examples:
    | function | descriptions_of_work | dates     | resources_used |
    | registrar avances | Se realizó la instalación de la cerámica en el piso del dormitorio | 01/01/2020 | 2 bolsas de cemento, 1 saco de pegamento, 1 caja de cerámica |
    | subir fotos o archivos | Foto de la cerámica instalada en el piso del dormitorio | 01/01/2020 | Foto de la cerámica instalada en el piso del dormitorio |

Scenario: Permitir visualización del progreso al contratante
Given que soy una empresa remodeladora y el contratante del proyecto desea visualizar el progreso
When el contratante accede a la plataforma y al proyecto correspondiente
Then el contratante puede ver el progreso del proyecto, incluyendo tareas realizadas, avances registrados y fotos o archivos subidos y el contratante puede realizar sugerencias de cambios o mejoras en el proyecto.

    Scenario Outline: Permitir visualización del progreso al contratante
    Given que soy una empresa remodeladora y el contratante del proyecto desea visualizar el progreso
    When el contratante accede a la plataforma y al proyecto correspondiente
    Then el contratante puede ver el progreso del proyecto, incluyendo "<tasks>", "<advances>" y "<photos_or_files>" y el contratante puede realizar "<suggestions>" de cambios o mejoras en el proyecto.

    Examples:
    | tasks | advances | photos_or_files | suggestions |                                                                                                
    | tareas realizadas | avances registrados | fotos o archivos subidos | sugerencias de cambios o mejoras en el proyecto |

    |tareas realizadas| avances registrados| fotos o archivos subidos| sugerencias de cambios o mejoras en el proyecto|
    |Cambiado de piso| Se realizó el cambiado de piso del dormitorio| Foto del piso del dormitorio|Cambiado de piso por uno de otro color |
    |Cambiado de techo| Se realizó el cambiado de techo del dormitorio| Foto del techo del dormitorio| Todo en perfecto orden  |



Scenario: Cerrar y dar por concluido el proyecto

Given que soy una empresa remodeladora y el proyecto de remodelación ha sido finalizado
When accedo a la función de cerrar y dar por concluido el proyecto
Then  se registra la finalización del proyecto en el sistema, se proporciona un mensaje de confirmación y el contratante puede confirmar la finalización y proporcionar su aprobación o realizar comentarios adicionales.

    Scenario Outline: Cerrar y dar por concluido el proyecto
    Given que soy una empresa remodeladora y el proyecto de remodelación ha sido finalizado
    When accedo a la "<function>" de cerrar y dar por concluido el proyecto
    Then  se registra la finalización del proyecto en el sistema, se proporciona un "<message>" de confirmación y el contratante puede confirmar la finalización y proporcionar su aprobación o realizar comentarios adicionales.

    Examples:
    | function                               | message                                     |
    | cerrar y dar por concluido el proyecto | El proyecto ha sido finalizado exitosamente |


Scenario:  Error en la recuperación de datos del proyecto

Given que soy una empresa remodeladora y deseo acceder a un proyecto de remodelación
When accedo a la función de acceder a un proyecto
And el sistema no puede recuperar los datos del proyecto
Then se muestra un mensaje de error y se proporciona la opción de volver a intentar o cancelar la operación.

    Scenario Outline: Error en la recuperación de datos del proyecto
    Given que soy una empresa remodeladora y deseo acceder a un proyecto de remodelación
    When accedo a la función de acceder a un proyecto
    And el sistema no puede recuperar los datos del proyecto
    Then se muestra un "<message>" de error y se proporciona la opción de volver a intentar o cancelar la operación.

    Examples:
    | message                                        |
    | Error en la recuperación de datos del proyecto |




                                                                                                                            