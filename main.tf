resource "random_pet" "this" {
  count = var.pet_count
}

output "pets" {
  value = [for x in random_pet.this : x.id]
}
