Feature:Manejo de citas por parte de empresas remodeladoras

Scenario: Verificar disponibilidad de citas 

Given que soy una empresa remodeladora registrada en la plataforma
When accedo a la función de manejo de citas
Then se me muestra un calendario con mis citas programadas y los horarios disponibles

    Scenario Outline: Verificar disponibilidad de citas
    Given soy una empresa remodeladora registrada en la plataforma
    When accedo a la <function> de manejo de citas
    Then se me muestra un <calendar> con mis citas programadas y los horarios disponibles

    Examples:
    | function | calendar       |
    | agendar  | shows calendar |



Scenario: Agendar una cita exitosamente 
Given que soy una empresa remodeladora registrada en la plataforma y tengo horarios disponibles 
When un contratante solicita agendar una cita conmigo
And selecciona una fecha y hora disponible 
Then se registra la cita exitosamente en el sistema y se bloquea el horario correspondiente 

    Scenario Outline: Agendar una cita exitosamente
    Given soy una empresa remodeladora registrada en la plataforma y tengo horarios disponibles
    When un contratante solicita agendar una cita conmigo
    And selecciona <date> y <hour> disponibles
    Then se registra la cita exitosamente en el sistema y se bloquea el horario correspondiente

    Examples:
    Given: Un contratante solicita agendar una cita conmigo
    | date       | hour  |
    | 2021-05-01 | 10:00 |

Scenario: Cancelar una cita
Given que soy una empresa remodeladora registrada en la plataforma y tengo una cita previamente agendada 
When accedo a la función de cancelar citas
And selecciono la cita que deseo cancelar
Then se cancela la cita en el sistema y se libera el horario correspondiente

    Scenario Outline: Cancelar una cita
    Given soy una empresa remodeladora registrada en la plataforma y tengo una cita previamente agendada
    When accedo a la <function> de cancelar citas
    And selecciono la <business apointment>que deseo cancelar
    Then se cancela la cita en el sistema y se libera el horario correspondiente

    Examples:
    | function | business apointment |
    | cancelar | cita 1              |

Scenario: Reprogramar una cita
Given que soy una empresa remodeladora registrada en la plataforma y tengo una cita previamente agendada
When accedo a la función de reprogramar citas
And selecciono la cita que deseo reprogramar 
And selecciono una nueva fecha y hora disponible para la cita 
Then se actualiza la cita en el sistema con la nueva fecha y hora seleccionada

    Scenario Outline: Reprogramar una cita
    Given soy una empresa remodeladora registrada en la plataforma y tengo una cita previamente agendada
    When accedo a la función de reprogramar citas
    And selecciono la <business apointment> que deseo reprogramar
    And selecciono una nueva <date> y <hour> disponible para la cita
    Then se actualiza la cita en el sistema con la nueva fecha y hora seleccionada 

    Examples:

    before:
    | business apointment | date       | hour  |
    | cita 1              | 2021-05-01 | 10:00 |

    after:
    | business apointment | date       | hour  |
    | cita 1              | 2021-05-02 | 11:00 |

Scenario: Error al agendar una cita
Given que soy una empresa remodeladora registrada en la plataforma 
When accedo a la función de manejo de citas 
And un contratante intenta agendar una cita en un horario que ya está ocupado
Then se muestra un mensaje de error indicando que el horario seleccionado no está disponible

    Scenario Outline: Error al agendar una cita
    Given soy una empresa remodeladora registrada en la plataforma
    When accedo a la <function> de manejo de citas
    And un contratante intenta agendar una cita en un horario que ya está ocupado
    Then se muestra un <message> de error indicando que el horario seleccionado no está disponible

    Examples:
    | function | message |
    | agendar  | error   |

Scenario:  Error al cancelar una cita 
Given que soy una empresa remodeladora registrada en la plataforma y tengo una cita previamente agendada 
When accedo a la función de cancelar citas
And selecciono una cita que no existe o ya ha sido cancelada
Then se muestra un mensaje de error indicando que la cita no se puede cancelar 

    Given soy una empresa remodeladora registrada en la plataforma y tengo una cita previamente agendada
    When accedo a la <function> de cancelar citas
    And selecciono una cita que no existe o ya ha sido cancelada
    Then se muestra un <message> de error indicando que la cita no se puede cancelar

    Examples:
    | function | message |
    | cancelar | error   |

