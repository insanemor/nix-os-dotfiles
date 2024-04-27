## Cofre de Senhas

# Manual 

Para configurar o cofre de senha , foi optado em ser feito via conf manual , para nao deixar isso no repo publico. 

'''bash 
    op vault list
'''

Com esse comando ele ja vai iniciar o processo de login. para finalizar pode entrar com esse comando

'''bash 
eval $(op signin)
'''

Apos esses comando ja sera possivel usar os comandos git do seu repos privados e usar todas suas sshkey e secret de Ambiente. 

Nesse ponto tambem é interesante fazer o login via ambiente grafico , para ele sincar tambem todas as senhas e cofres do linux para seu ambiente , isso se voce usar o 1password. 
