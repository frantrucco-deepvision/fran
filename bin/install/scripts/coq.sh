coq_version="8.8.1"
export OPAMROOT=/home/fran/.opam-coq.$coq_version
# mkdir -p $OPAMROOT
# mkdir -p ~/.opam

yes | sudo apt install m4;
opam init -n --comp 4.02.3 -j 4;
eval `opam config env --root=/home/fran/.opam-coq.8.8.1`;
opam repo --yes add coq-released http://coq.inria.fr/opam/released;
opam install --yes coq.$coq_version;
opam pin --yes add coq $coq_version;

 echo "export OPAMROOT=/home/fran/.opam-coq.$coq_version" >> ~/.zshrc
 echo "eval \`opam config env --root=/home/fran/.opam-coq.$coq_version\`" >> ~/.zshrc
