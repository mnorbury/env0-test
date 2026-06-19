resource "random_pet" "this" {
  count = 10
}

output "pets" {
  value = [for x in random_pet.this : x.id]
}
