<!-- a) pour les documents XML respectant la DTD en 7 : fournir les contenus des éléments <glossaire> ; -->
//glossaire[text()]
<!-- b) pour les documents XML respectant la DTD en 7 : fournir le premier élément <glossaire> ; -->
/descendant::glossaire[1]
/descendant::glossaire[position()=1]
<!-- c) pour les documents XML respectant la DTD en 7 : fournir les éléments <glossaire> n’ayant pas d’attribut auteur ; -->
//glossaire[not(@auteur)]
/descendant::glossaire[not(@auteur)]
<!-- d) pour vos documents XHTML : fournir les valeurs des attributs href ; -->
//attribute::href
/descendant::*/attribute::href
<!-- e) pour vos documents XHTML : compter le nombre d’images dans un document XHTML -->
//img[count(self::node())]