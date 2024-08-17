# Flake

Basicamente esse arquivo 'e composto de Outputs e Inputs.

## Inputs

Aqui podemos incluir outros repos externos para completar a solução. como básico o necessário seria usar o repo do nixpkgs e o do home-manager.

Segue um exemplo:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };
}
```

Acredito que preciso fazer uma analise mais afundo se precisa usar todos que estão aqui hoje.

Outra coisa que no passado eu tentei fazer algumas tentativas de repo publico e repo privado para configurações sensíveis, nesse momento do discovery eu nao lembro como ta sendo feito ou qual era a minha ideia de resolver isso. mas vejo que esse outro repo esta documentado, e lembro que tinha achado uma solução melhor.

## Outputs

Aqui 'e onde ele vai apontar e separar as configurações de system e user. mas nesse repo em especifico eu usei uma abordagem de um cara que eu peguei na internet que eu achei bem legal, mas 'e muito difícil de ver alguém resolver dessa forma. o que difere ele 'e que ele abre o outputs com todos os inputs depois ele abre um `LET` e cria varias variáveis que podem ser alteradas de acordo com o que voce deseja. e estão bem separadas para variáveis de `system` e de `user`.
