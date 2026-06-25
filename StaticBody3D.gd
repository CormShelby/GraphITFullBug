extends StaticBody3D
# Force de repoussement
var repel_force = 1000.0

# Détection de collision avec un autre corps
func _on_body_entered(body):
	if body is CharacterBody3D:
		# Calculer la direction du repoussement (de l'objet vers le personnage)
		var direction = (body.global_transform.origin - global_transform.origin)
		direction.y = 0  # Ignorer la différence de hauteur
		direction = direction.normalized()  # Normaliser le vecteur pour la direction
  # Vers l'arrière (axe Z négatif)

		# Appliquer une force de repoussement sur le personnage
		body.velocity += direction * repel_force
