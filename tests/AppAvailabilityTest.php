<?php
namespace App\Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class AppAvailabilityTest extends WebTestCase
{
    /**
     * @dataProvider urlProvider
     */
    public function testPageIsSuccessful($url,$expectedStatus)
    {
        $client = self::createClient();
        $client->request('GET', $url);

        $this->assertEquals($expectedStatus, $client->getResponse()->getStatusCode());
    }

    public function urlProvider()
    {
        yield ['/',200];
        yield ['/inscription',200];
        yield ['/connexion',200];
        yield ['/deconnexion',302];
        yield ['/reinitialisation-test',404];
        yield ['/404--modifier/mot-de-passe', 404];
        yield ['/', 200];
        yield ['/trick/ajouter', 302];
        yield ['/trick/modifier/404-test', 404];
        yield ['/trick/404-ajouter', 404];
        yield ['/trick/delete-404', 404];
        yield ['/supprimer/image/404', 404];
        yield ['/supprimer/video/404', 404];
        yield ['/modifier/404-test', 404];
        yield ['/mot-de-passe-oublie', 200];
    }
}