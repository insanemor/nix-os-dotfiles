# Tentativa de redocumentar o projeto

Fiquei um tempo sem dar continuidade no projeto e quando voltei me perdi. A ideia 'e fazer um discovery do repo, testar algumas coisas e descobrir onde eu parei e onde continuar.

Esse arquivo vou colocar considerações gerais quanto ao projeto, e vou criar outros arquivos com o nome do arquivo nix que quero explorar a doc dele.

## Projeto

Baicamento o projeto 'e dividido em dois grandes blocos, o primeiro 'e onde instala e configura o sistema operacional a nível de MAQUINA ( system ) e o segundo 'e onde instala e configura o sistema operacional a nível de USUÁRIO ( user ).

### System

O system 'e responsável por instalar e configurar o sistema operacional a nível de maquina. Ele 'e responsável por instalar e configurar o NixOS. Em termos de código ele chama de nixosConfigurations.

Aqui segue um exemplo da conf atual , nao sei se vou manter esse exemplo atualizado, mas serve como referencia de como encontrar essa divisão.

```nix
  nixosConfigurations = {
    system = lib.nixosSystem {
      system = systemSettings.system;
      modules = [
        (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
      ]; # load configuration.nix from selected PROFILE
      specialArgs = {
        # pass config variables from above
        inherit pkgs-stable;
        inherit systemSettings;
        inherit userSettings;
        inherit inputs;
      };
    };
  };
```

### User

O user 'e responsável por instalar e configurar o sistema operacional a nível de usuário. Ele 'e responsável por instalar e configurar o Home Manager e instalar o Nix Flake. Em termos de código ele chama de homeConfigurations.

Aqui segue um exemplo da conf atual, nao sei se vou manter esse exemplo atualizado, mas serve como referencia de como encontrar essa divisão.

```nix
  homeConfigurations = {
    user = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix") # load home.nix from selected PROFILE
      ];
      extraSpecialArgs = {
        # pass config variables from above
        inherit pkgs-stable;
        inherit systemSettings;
        inherit userSettings;
        inherit inputs;
      };
    };
  };
```

### Como funciona ?

Como pode ver no README.md temos vários comandos para instalar atualizar e sync as confs, nao vou entrar aqui nesse mérito de como usa a ferramenta, mas a ideia aqui 'e documentar o que o código faz quando voce esta rodando esses comandos...

Em termos básico sabemos que temos dois comandos por baixo dos panos, o `nixos-rebuild` e o `home-manager switch`. O `nixos-rebuild` 'e responsável por instalar e configurar o sistema operacional a nível de maquina e o `home-manager switch` 'e responsável por instalar e configurar o sistema operacional a nível de usuário.

Como pode ver nada mais 'e do que um comando para aplicar as configurações de system e de usuário, separados pelo home-manager e nixos-rebuild. o código pode se confundir nesse momento como ele tem vários includes por assim dizer, e isso pode ser bem versátil e confuso ao mesmo tempo. temos algumas separações de pastas para ajudar a entender o que esta sendo carregado e onde esta sendo carregado. essas duas pastas sao `system` e `user`.

#### system

Dentro dessa pasta teremos todos as configurações e todos os apps que saram instalados no nível de SO. isso serve para themes entre outros detalhes também.

#### user

Dentro dessa pasta teremos todos as configurações e todos os apps que saram instalados no nível de usuário. isso serve para themes entre outros detalhes também.

#### Estruturas de pastas

Temos uma separação de pastas, ja vimos acima que temos a pasta `system` e `user`, mas temos mais algumas pastas vamos entender elas.

##### profiles

A ideia aqui 'e ter profiles que vao ser determinado qual esta sendo usado isso vem pela variável `systemSettings.profile` que 'e carregada no `system` e no `user`.

Como pode ver nesse trexo que ja esta no print acima.

```nix
        modules = [
          (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix") # load home.nix from selected PROFILE
        ];
```

A ideia 'e ter um perfil para cada objetivo, por exemplo, um perfil para devops, um perfil para games, um perfil para clientes, e o básico que vai ter em todos os perfis.

Dentro de cada pasta vamos encontrar dois arquivos, um `configuration.nix` e um `home.nix`.

O `configuration.nix` 'e responsável por instalar e configurar o sistema operacional a nível de maquina e o `home.nix` 'e responsável por instalar e configurar o sistema operacional a nível de usuário.

##### machines

Aqui vamos ver subpastas que representam maquinas físicas ou virtuais, a ideia 'e ter um script que identifica a maquina e carrega a configuração correta de hardware. Então toda a configuração de hardware deve ser colocada aqui.

- Como funciona esse passo ?

O flake.nix ele vi no arquivo `default.nix` que ta na raiz dassa pasta. esse arquivo vai importar o arquivo correto de acordo com a maquina que ele esta rodando. Mas ele nao ta funcionando ainda.

Como pode ver ja existe um BUG reportado no README, validar esse passo quando esse BUG for resolvido.

```md
  - [ ] script que indentifica a maquina e carrega a configuração correta de hardware
```

##### themes

Essa pasta nao tem muito segredo, sao subpastas contendo temas que sao usado por diversas ferramentas que sao compatíveis com esses themes.
