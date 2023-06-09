Feature: Acceso a la cuenta independientemente del rol del usuario

Scenario: Acceso a la cuenta como contratante
  Given soy un contratante registrado en la plataforma
  When deseo acceder a mi cuenta con mi nombre de usuario y contraseña correspondientes
  Then se me redirige a mi perfil de cliente con todas las opciones y características disponibles para mí

Scenario: Acceso a la cuenta como remodelador
  Given soy un remodelador registrado en la plataforma
  When deseo acceder a mi cuenta con mi nombre de usuario y contraseña correspondientes
  Then se me redirige a mi panel de administración con todas las herramientas y funcionalidades propias de mi rol

Scenario Outline: Acceso a la cuenta con diferentes roles
  Given soy un <rol> registrado en la plataforma
  When deseo acceder a mi cuenta con mi <username> y <password> correspondientes
  Then se me redirige a mi <dashboard> con todas las opciones y características disponibles para mí

Examples:
  | rol           |    username  |   password   |         dashboard           |
  | contratante   | FelipeGarcia#|  felipe123#  |    dashboard de cliente     |
  | remodelador   | LautaresRM   |  lauCorps#2  |    dashboard de remodelador |


Scenario: Acceso fallido con credenciales incorrectas
  Given soy un usuario registrado en la plataforma
  When intento acceder a mi cuenta con mi nombre de usuario correcto y mi contraseña incorrecta
  Then recibo un mensaje de error indicando que las credenciales son inválidas

  Scenario Outline: Acceso fallido con diferentes roles
  Given soy un <rol> registrado en la plataforma
  When intento acceder a mi cuenta con mi <password> incorrecto
  Then recibo un <message> de error indicando que las credenciales son inválidas
  
  Examples:
    |rol         | username     |   password    |   message                                   |
    |contratante | FelipeGarcia#|  felipe1234#  |  Credenciales inválidas , intentelo denuevo |
    |remodelador | LautaresRM   |  lauCorps#    |  Credenciales inválidas , intentelo denuevo |

Scenario: Acceso fallido a cuenta inexistente
  Given soy un usuario no registrado en la plataforma
  When intento acceder a una cuenta que no existe con un nombre de usuario y contraseña invalidos
  Then recibo un mensaje de error indicando que la cuenta no existe

Scenario Outline: Acceso fallido a cuenta inexistente
  Given soy un <rol> no registrado en la plataforma
  When intento acceder a una cuenta que no existe con un <username> y <password> invalidos
  Then recibo un <message> de error indicando que la cuenta no existe
  
  Examples:
    |rol         | username     |   password    |   message                                   |
    |contratante | Felipon12345#|  felipon213#  |  La cuenta no existe                        |
    |remodelador | MakCorport   |  guaCorps#    |  La cuenta no existe                        |


Scenario: Recuperación de cuenta
  Given soy un usuario registrado en la plataforma y he olvidado mi contraseña
  When deseo acceder a mi cuenta 
  Then accedo a un formulario de recuperación de contraseña



