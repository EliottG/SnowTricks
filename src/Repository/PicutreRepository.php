<?php

namespace App\Repository;

use App\Entity\Picutre;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Picutre|null find($id, $lockMode = null, $lockVersion = null)
 * @method Picutre|null findOneBy(array $criteria, array $orderBy = null)
 * @method Picutre[]    findAll()
 * @method Picutre[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PicutreRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Picutre::class);
    }

    // /**
    //  * @return Picutre[] Returns an array of Picutre objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Picutre
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
