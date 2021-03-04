<?php namespace Xethron\MigrationsGenerator\Generators;

class ForeignKeyGenerator
{
    /**
     * @var string
     */
    protected $table;

    /**
     * Get array of foreign keys
     *
     * @param  string  $table  Table name
     * @param  \Doctrine\DBAL\Schema\AbstractSchemaManager  $schema
     * @param  bool  $ignoreForeignKeyNames
     *
     * @return array
     */
    public function generate(string $table, $schema, bool $ignoreForeignKeyNames): array
    {
        $this->table = $table;
        $fields = [];

        $foreignKeys = $schema->listTableForeignKeys($table);

        if (empty($foreignKeys)) {
            return [];
        }

        foreach ($foreignKeys as $foreignKey) {
            $fields[] = [
                'name' => $this->getName($foreignKey, $ignoreForeignKeyNames),
                'field' => $foreignKey->getLocalColumns()[0],
                'references' => $foreignKey->getForeignColumns()[0],
                'on' => $foreignKey->getForeignTableName(),
                'onUpdate' => $foreignKey->hasOption('onUpdate') ? $foreignKey->getOption('onUpdate') : 'RESTRICT',
                'onDelete' => $foreignKey->hasOption('onDelete') ? $foreignKey->getOption('onDelete') : 'RESTRICT',
            ];
        }
        return $fields;
    }

    /**
     * @param  \Doctrine\DBAL\Schema\ForeignKeyConstraint  $foreignKey
     * @param  bool  $ignoreForeignKeyNames
     *
     * @return null|string
     */
    private function getName($foreignKey, bool $ignoreForeignKeyNames): ?string
    {
        if ($ignoreForeignKeyNames or $this->isDefaultName($foreignKey)) {
            return null;
        }
        return $foreignKey->getName();
    }

    /**
     * @param  \Doctrine\DBAL\Schema\ForeignKeyConstraint  $foreignKey
     *
     * @return bool
     */
    private function isDefaultName($foreignKey): bool
    {
        return $foreignKey->getName() === $this->createIndexName($foreignKey->getLocalColumns()[0]);
    }

    /**
     * Create a default index name for the table.
     *
     * @param  string  $column
     * @return string
     */
    protected function createIndexName(string $column): string
    {
        $index = strtolower($this->table.'_'.$column.'_foreign');

        return str_replace(['-', '.'], '_', $index);
    }
}
